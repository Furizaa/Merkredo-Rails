Merkredo.LoginView = Merkredo.ModalBodyView.extend

  templateName: 'modal_login'
  title: '_LOGIN_%I18N%'

  showView: (view) ->
    @get('controller').show view


