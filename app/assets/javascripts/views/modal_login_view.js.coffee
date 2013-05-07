Merkredo.LoginView = Merkredo.ModalBodyView.extend

  templateName: 'modal_login'
  #siteBinding: 'Merkredo.site'
  title: '__LOGIN_I18N'

  showView: (view) ->
    @get('controller').show view
