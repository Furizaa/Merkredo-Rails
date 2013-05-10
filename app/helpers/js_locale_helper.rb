module JsLocaleHelper

  def self.output_locale(locale)
    locale_str = locale.to_s
    translations = YAML::load(File.open("#{Rails.root}/config/locales/client.#{locale_str}.yml"))

    result =  "I18n.translations = #{translations.to_json};\n"
    result << "I18n.locale = '#{locale_str}';\n"
    result
  end

end
