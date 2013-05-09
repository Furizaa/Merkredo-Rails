Merkredo.LoginView = Merkredo.ModalBodyView.extend

  templateName: 'modal_login'
  title: '_LOGIN_%I18N%'

  showView: (view) ->
    @get('controller').show view

  newAccount: ->
    @showView Merkredo.CreateAccountView.create()

  login: ->
    ajax = Merkredo.ajax '/session',
      type: 'POST'
      data:
        email: @get('loginEmail') || ''
        password: @get('loginPassword') || ''

    ajax.then (result) =>
      if result.error
        @flash result.error, 'alert'

    ,() =>
      @flash 'login.err%I18N%', 'alert'









