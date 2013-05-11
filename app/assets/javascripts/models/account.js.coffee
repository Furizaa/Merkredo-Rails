Merkredo.Account = Merkredo.Model.extend()

Merkredo.Account.reopenClass

  createAccount: (email, password) ->
    Merkredo.ajax '/accounts',
      type: 'POST'
      data:
        email: email
        password: password

  checkEmail: (email) ->
    Merkredo.ajax '/accounts/check_email',
      data:
        email: email