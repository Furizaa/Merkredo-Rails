Merkredo.Account = Merkredo.Model.extend()

Merkredo.Account.reopenClass

  createAccount: (email, password, passwordConfirm) ->
    Merkredo.ajax '/accounts',
      type: 'POST'
      data:
        email: email
        password: password
        password_confirmation: passwordConfirm