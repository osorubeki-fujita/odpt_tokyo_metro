class TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace

  module InfoOfRows

    private

    def number_of_files
      @matched_rows.map( &:filename ).uniq.length
    end

    def number_of_rows
      @matched_rows.length
    end

    def display_info_of_rows( indent = 0 )
      puts ""
      puts " " * indent + "#{ number_of_files } files , #{ number_of_rows } rows"
      puts ""
    end

  end

  def initialize( namespace , files )
    @namespace = namespace
    @files = files
    @matched_rows = ::Array.new

    set_regexp_list
  end

  include InfoOfRows

  def search
    @files.each do | filename |
      #-------- [begin] processing each file
      ::File.open( filename , "r:UTF-8" ).read.split( /\n/ ).each.with_index(1) do | row_content , row_number |
        match = false
        #-------- [begin] processing each regexp
        @regexp_list.each_with_index do | regexp , i |
          if regexp === row_content
            @matched_rows << ::TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace::MatchedRow.new( filename , row_content , row_number , i )
          end
        end
        #-------- [end] processing each regexp
      end
      #-------- [end] processing each file
    end

    return self
  end

  def display
    puts "=" * 64
    puts ""
    puts "**** #{ @namespace }"
    puts ""

    indent = 4

    _filename_length_max = filename_length_max
    @matched_rows.group_by( &:regexp_index ).each do | regexp_index , rows |
      ::TokyoMetro::Rake::CheckNamespace::RenameTable::Namespace::MatchGroup.new( rows , @regexp_list[ regexp_index ] , _filename_length_max ).display( indent )
    end

    display_info_of_rows
  end

  private

  def set_regexp_list
    ary = ::Array.new

    ary << /(?:#{ @namespace }(?:Decorator)?|#{ @namespace.underscore }|#{ @namespace.underscore.pluralize })(?: |\.|\:|\Z)/
    ary << /\"(?:#{ @namespace }(?:Decorator)?|#{ @namespace.underscore }|#{ @namespace.underscore.pluralize })(?:_id)?\"/

    @regexp_list = ary
  end

  def filename_length_max
    n = @matched_rows.map( &:filename_length ).max
    if n.present?
      n + 4
    else
      0
    end
  end

end
