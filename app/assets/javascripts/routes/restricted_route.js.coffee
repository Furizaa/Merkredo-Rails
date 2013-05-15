Merkredo.RestrictedRoute = Merkredo.Route.extend

  redirect: ->
    account = Merkredo.get 'currentAccount'
    if not account
      @transitionTo 'ecom'