# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# verify that application Javascript files are lintable
# see https://github.com/psionides/jslint_on_rails
guard 'jshint-on-rails', config_path: 'config/jshint.yml' do
  # watch for changes to application javascript files
  watch(%r{^app/assets/javascripts/.*\.js$})
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(scss|css|js|html))).*}) { |m| "/assets/#{m[3]}" }
end
