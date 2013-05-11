#= require jquery
#= require jquery_ujs
#= require foundation
#= require handlebars
#= require ember

#= require_tree ./vendor

#= require ./helpers/i18n_helpers

#= require ./merkredo
#= require_tree ./mixins
#= require_tree ./components

#= require ./views/view
#= require ./models/merkredo

#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./routes

#= require_self

$ =>
  $(document).foundation()
