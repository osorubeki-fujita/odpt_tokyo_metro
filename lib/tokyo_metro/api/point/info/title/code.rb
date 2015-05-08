class TokyoMetro::Api::Point::Info::Title::Code

  def initialize( code , additional_info_ja )
    @first_char = nil
    @number = nil
    @last_char = nil
    @other_info = nil
    @additional_info_ja = nil

    if code.string?
      if /\A([A-Z]?)(\d{1,2})([a-z]?)/ =~ code
        @first_char = $1
        @number = $2.to_i
        @last_char = $3
      else
        @other_info = code
      end
    else
      raise "Error: #{ code } is not valid."
    end

    if additional_info_ja.present?
      @additional_info_ja = additional_info_ja
    end
  end

  attr_reader :first_char
  attr_reader :number
  attr_reader :last_char
  attr_reader :other_info
  attr_reader :additional_info_ja

  def <=>( other )
    #-------- first_char が異なる場合
    c_first_char = compare_by( :first_char )
    if c_first_char.present?
      return c_first_char
    end

    #-------- first_char が同じで number が異なる場合
    c_number = compare_by( :number )
    if c_number.present?
      return c_number
    end

    #-------- first_char, number が同じで last_char が異なる場合
    c_last_char = compare_by( :last_char )
    if c_last_char.present?
      return c_last_char
    end

    c_other_info = compare_by( :other_info )
    if c_other_info.present?
      return c_other_info
    end

    c_additional_info_ja = compare_by( :additional_info_ja )
    if c_additional_info_ja.present?
      return c_additional_info_ja
    end

    return 0
  end
  
  private
  
  def compare_by( method_name )
    if send( method_name ).blank? and other.send( method_name ).present?
      return -1
    elsif send( method_name ).present? and other.send( method_name ).present?
      unless send( method_name ) == other.send( method_name )
        return ( send( method_name ) <=> other.send( method_name ) )
      end
    elsif send( method_name ).present? and other.send( method_name ).blank?
      return 1
    else
      nil
    end
  end

end