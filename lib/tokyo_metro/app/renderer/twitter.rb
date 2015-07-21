class TokyoMetro::App::Renderer::Twitter < TokyoMetro::Factory::Decorate::MetaClass

  def initialize( request , setting , railway_line_infos = nil , visibility: :visible )
    raise "Error" unless setting == :tokyo_metro or setting == :railway_line_infos
    raise "Error" if setting == :railway_line_infos and railway_line_infos.blank?
    raise "Error" unless visibility == :visible or visibility == :hidden
    super( request )
    @setting = setting
    @railway_line_infos = [ railway_line_infos ].flatten
    @visibility = visibility
  end

  def render
    h.render inline: <<-HAML , type: :haml , locals: h_locals
%div{ id: :twitters , class: visibility }
  = ::TokyoMetro::App::Renderer::Twitter::Header.new( request , visibility ).render
  %div{ id: :twitter_accounts }
    - # %ul{ id: :twitter_tabs_for_each_acount }
    - #   %li{ id: :twitter_tab_tokyo_metro }<
    - #    = ::Operator.tokyo_metro.decorate.render_logo
    - if setting == :tokyo_metro
      %div{ id: :tweets_of_tokyo_metro , class: :twitter_account }
        = ::ApplicationHelper.tokyo_metro.decorate.render_twitter_widget
    - elsif setting == :railway_line_infos
      - if railway_line_infos.length == 1
        = railway_line_infos.first.decorate.render_twitter_widget
      - else
        - railway_line_infos.each do | railway_line |
          = railway_line.decorate.render_twitter_widget
  = ::TwitterAccountDecorator.embed_twitter_script
    HAML
  end

  private

  def h_locals
    super.merge({
      setting: @setting ,
      railway_line_infos: railway_line_infos_to_render ,
      visibility: @visibility
    })
  end

  def railway_line_infos_to_render
    unless @setting == :railway_line_infos
      return nil
    end

    if @railway_line_infos.map( &:same_as ).include?( "odpt.Railway:TokyoMetro.MarunouchiBranch" )
      if @railway_line_infos.length == 1
        return ::Railway::Line::Info.where( same_as: "odpt.Railway:TokyoMetro.Marunouchi" )
      else
        return @railway_line_infos.delete_if { | item | item.same_as == "odpt.Railway:TokyoMetro.MarunouchiBranch" }
      end
    end

    if @railway_line_infos.map( &:same_as ).include?( "odpt.Railway:TokyoMetro.ChiyodaBranch" )
      if @railway_line_infos.length == 1
        return ::Railway::Line::Info.where( same_as: "odpt.Railway:TokyoMetro.Chiyoda" )
      else
        return @railway_line_infos.delete_if { | item | item.same_as == "odpt.Railway:TokyoMetro.ChiyodaBranch" }
      end
    end

    return @railway_line_infos
  end

end
