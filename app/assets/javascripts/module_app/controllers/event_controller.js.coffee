Merkredo.AppEventController = Ember.Controller.extend

  day_of_month: ( ->
    moment(@get('model.dtbegin')).format 'DD'
  ).property 'model.dtbegin'

  calendar: ( ->
    moment(@get('model.dtbegin')).calendar()
  ).property 'moment_begin'
