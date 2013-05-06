#= require jquery
#= require jquery_ujs
#= require foundation
#= require handlebars
#= require ember
#= require_self
#= require merkredo
window.Merkredo = Merkredo = Ember.Application.create()

#= require_tree .

$ =>
  $(document).foundation()
