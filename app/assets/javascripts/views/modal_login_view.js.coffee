Merkredo.LoginView = Merkredo.ModalBodyView.extend

  templateName: 'modal_login'
  title: Em.String.i18n 'account.login.title'

  formSubmitted: false

  showView: (view) ->
    @get('controller').show view

  newAccount: ->
    @showView Merkredo.CreateAccountView.create()

  loginButtonText: ( ->
    if @get 'formSubmitted'
      return Em.String.i18n 'account.login.action.load'
    else
      return Em.String.i18n 'account.login.action.default'
  ).property 'formSubmitted'

  loginDisabled: ( ->
    return true if @get 'formSubmitted'
    return true if @blank 'loginPassword'
    return true if @blank 'loginEmail'
  ).property 'formSubmitted', 'loginEmail', 'loginPassword'

  login: ->
    @set 'formSubmitted', true
    ajax = Merkredo.ajax '/session',
      type: 'POST'
      data:
        email: @get('loginEmail') || ''
        password: @get('loginPassword') || ''

    ajax.then (result) =>
      if result.error
        @set 'formSubmitted', false
        @flash result.error, 'alert'
      else
        window.location.reload()

    ,() =>
      @flash Em.String.i18n('account.login.action.failed'), 'alert'









