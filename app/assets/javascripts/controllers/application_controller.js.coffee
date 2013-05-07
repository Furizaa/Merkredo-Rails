Merkredo.ApplicationController = Ember.Controller.extend

  needs: ['modal']

  showLogin: ->
    console.log(@get('controllers.modal'));
    @get('controllers.modal')?.show(
      Merkredo.LoginView.create()
    )