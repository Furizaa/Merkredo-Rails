Merkredo.Route.buildRoutes ->

  @route 'ecom', { path: '/' }
  @resource 'app', { path: '/app'}, ->
    @route 'events'
