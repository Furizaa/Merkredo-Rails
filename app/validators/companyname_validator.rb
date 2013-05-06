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
      self.errors << I18n.t(:'comapny.name.blank')
    end
  end

  def name_length_min?
    return unless errors.empty?
    if name.length < Company.name_length.begin
      self.errors << I18n.t(:'company.name.short', min: Company.name_length.begin)
    end
  end

  def name_length_max?
    return unless errors.empty?
    if name.length > Company.name_length.end
      self.errors << I18n.t(:'company.name.long', max: Company.name_length.end)
    end
  end

  def name_char_valid?
    return unless errors.empty?
    if name =~ /[^A-Za-z0-9&\.\ ]/
      self.errors << I18n.t(:'company.name.characters')
    end
  end

end
