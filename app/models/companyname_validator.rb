class CompanynameValidator

  def initialize(name)
    @name = name
    @errors = []
  end
  attr_accessor :errors
  attr_reader :name

  def valid_format?
    name_empty?
    name_length_min?
    name_length_max?
    name_char_valid?
    errors.empty?
  end

  private

  def name_empty?
    return unless errors.empty?
    unless name
      self.errors << 'to empty'
    end
  end

  def name_length_min?
    return unless errors.empty?
    if name.length < Company.name_length.begin
      self.errors << 'to short'
    end
  end

  def name_length_max?
    return unless errors.empty?
    if name.length > Company.name_length.end
      self.errors << 'to long'
    end
  end

  def name_char_valid?
    return unless errors.empty?
    if name =~ /[^A-Za-z0-9&\.\ ]/
      self.errors << 'invalid char'
    end
  end

end
