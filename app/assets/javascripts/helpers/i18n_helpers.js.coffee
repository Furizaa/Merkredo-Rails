Ember.Handlebars.registerHelper 'i18n', (property, options) ->
  params = options.hash
  Object.keys params, (key, value) =>
    params[key] = Em.Handlebars.get @, value, options

  Ember.String.i18n property, params


Ember.String.i18n = (scope, options) ->
  I18n.translate 'js.' + scope, options


Ember.Handlebars.registerHelper 'countI18n', (key, options) ->
  view = Ember.View.extend
    tagName: 'span'
    render: (buffer) -> buffer.push(Ember.String.i18n key, count: @get('count'))
    countChanged: (-> @rerender()).observes 'count'

  Ember.Handlebars.helpers.view.call @, view, options


if Ember.EXTEND_PROTOTYPES
  String.prototype.i18n = (options) ->
    Ember.String.i18n String(@), options
