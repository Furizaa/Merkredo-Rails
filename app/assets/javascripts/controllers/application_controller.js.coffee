Merkredo.ApplicationController = Ember.Controller.extend

  needs: ['modal']

  showLogin: ->
    @get('controllers.modal')?.show(
      Merkredo.LoginView.create()
    )