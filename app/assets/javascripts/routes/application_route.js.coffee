Merkredo.ApplicationRoute = Merkredo.Route.extend

  setupController: (controller) ->
    currentAccount = ServerStore.get 'currentAccount'
    if currentAccount
      Merkredo.set 'currentAccount', Merkredo.Account.create(currentAccount)

    ServerStore.remove 'currentAccount'