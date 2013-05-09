Merkredo.CreateAccountView = Merkredo.ModalBodyView.extend

  templateName: 'create_account'
  title: 'create_account%I18N'

  createAccount: ->
    ajax = Merkredo.Account.createAccount @get('accountEmail'), @get('accountPassword'), @get('accountPasswordConfirmation')
    ajax.then (result) =>
      console.log(result)
      if result.success
        @flash '', 'success'
        #window.location.reload()
      else
        @flash result.message || 'create_failed%I18N%', 'alert'

    ,() =>
      @flash 'create_failed%I18N%', 'alert'


