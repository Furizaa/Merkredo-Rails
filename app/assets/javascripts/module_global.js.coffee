#= require jquery
#= require jquery_ujs
#= require foundation
#= require handlebars
#= require ember

#= require_tree ./vendor

#= require ./helpers/i18n_helpers

#= require ./merkredo
#= require_tree ./mixins

# Do NOT require the full components tree!
#= require ./components/debounce
#= require ./components/utils

#= require ./module_global/views/view
#= require ./module_global/models/model
#= require ./module_global/routes/route

#= require_tree ./module_global/controllers
#= require_tree ./module_global/models
#= require_tree ./module_global/templates
#= require_tree ./module_global/views
#= require_tree ./module_global/helpers
#= require_tree ./module_global/routes

#= require_self

$ => $(document).foundation()
