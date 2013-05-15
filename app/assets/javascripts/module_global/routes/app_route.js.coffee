# Route exists soly to redirect no-session users out of the app space
# I we have a session user this route object will be overwritten by module_app
Merkredo.AppRoute = Merkredo.Route.extend
  redirect: ->
    @transitionTo 'ecom'