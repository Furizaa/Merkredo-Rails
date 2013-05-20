class RealNameValidator

  def initialize(errors, first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @errors = errors
  end

  def validate
    test = /[\$"!§%&\\\/\(\)=\?\*\+#\@0-9]/i
    if @first_name =~ test
      @errors.add(:first_name, I18n.t(:'models.generic.first_name.characters'))
    end
    if @last_name =~ test
      @errors.add(:last_name, I18n.t(:'models.generic.last_name.characters'))
    end
  end

end
