Merkredo.Route = Ember.Route.extend

  enter: (router, context) ->

    # Called every time we enter a route

Merkredo.Route.reopenClass

  buildRoutes: (builder) ->
    oldBuilder = Merkredo.routeBuilder
    Merkredo.routeBuilder = ->
      oldBuilder.call @ if oldBuilder
      builder.call @