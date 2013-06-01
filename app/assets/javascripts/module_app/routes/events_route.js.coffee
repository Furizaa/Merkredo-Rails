Merkredo.AppEventsRoute = Merkredo.AppEventsIndexRoute = Merkredo.AppRoute.extend

  renderTemplate: ->
    @render 'module_app/events'

  model: ->
    Merkredo.Event.findAll()
