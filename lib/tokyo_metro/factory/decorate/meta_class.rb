class TokyoMetro::Factory::Decorate::MetaClass

  def self.initialize_in_rails_app
    self.class_eval do
      # include ::Rails.application.routes.url_helpers

      # @note link_to , link_to_unless_current , url_for , current_page?
      @@action_view_base = ::ActionView::Base.new

      # @return [::Module]
      @@action_view_helpers = ::ActionView::Helpers::UrlHelper

      # @return [::ActionController::Base]
      # @note url_for
      @@action_controller_base = ::ActionController::Base.new

      # @return [::Module]
      # @note url_for
      @@url_helpers = ::Rails.application.routes.url_helpers

      # @return [::ActionView::Base]
      # @note オリジナルの helper メソッド
      # @note url_for は利用不可
      @@application_controller_helper = ::ApplicationController.helpers
    end
  end

  def initialize( request )
    @request = request
  end

  attr_reader :request

  def path
    recognize_path( @request.referer )
  end

  def current_host
    @request.host
  end

  [ :controller , :action ].each do | method_base_name |
    eval <<-DEF
      def #{ method_base_name }_of( url )
        current_position( :#{ method_base_name } )
      end

      def current_#{ method_base_name }
        #{ method_base_name }_of( fullpath )
      end
    DEF
  end

  [ :railway_line , :station , :survey_year ].each do | method_base_name |
    eval <<-DEF
      def #{ method_base_name }_of( url )
        current_position( :#{ method_base_name } )
      end

      def current_#{ method_base_name }
        #{ method_base_name }_of( fullpath )
      end
    DEF
  end

  def fullpath
    @request.fullpath
  end

  def recognize_path( url )
    ::Rails.application.routes.recognize_path( url )
  end

  private
  
  def current_position( hash_key_name )
    begin
      return recognize_path( fullpath )[ hash_key_name.to_sym ]
    rescue ::ActionController::RoutingError
      return nil
    end
  end

  def method_missing( method_name , *args )
    if /\Acurrent_([a-z_]+)\Z/ =~ method_name.to_s
      if args.blank?
        current_position( $1 )
      end
    end
    return super( method_name , args )
  end

  def default_url_options
    ::ActionController::Base.default_url_options
  end

  def h_locals
    {
      request: @request ,
      default_url_options: default_url_options ,
      h: h ,
      u: u ,
      c: c ,
      v: v
    }
  end

  def v
    @@action_view_base
  end

  def c
    @@action_controller_base
  end

  def u
    @@url_helpers
  end

  def url_helpers
    @@url_helpers
  end

  def h
    @@application_controller_helper
  end

  def current_page?( arg )
    if arg.instance_of?( ::String )
      fullpath == arg

    elsif arg.instance_of?( ::Hash )
      arg.all? { | key ,value |
        current_info = send( "current_#{ key }" )

        if value.instance_of?( ::Array )
          value.flatten.map( &:to_s ).include?( current_info.to_s )
        else
          current_info.to_s == value.to_s
        end
      }

    else
      raise "Error"
    end
  end

  class << self

    private

    def default_url_options
      ::ActionController::Base.default_url_options
    end

    def v
      @@action_view_base
    end

    def c
      @@action_controller_base
    end

    def u
      @@url_helpers
    end

    def url_helpers
      @@url_helpers
    end

    def h
      @@application_controller_helper
    end

  end

end