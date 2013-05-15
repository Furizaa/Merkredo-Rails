Merkredo.EcomRoute = Merkredo.Route.extend

  redirect: ->
    account = Merkredo.get 'currentAccount'
    if account
      @transitionTo 'master'
