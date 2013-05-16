Merkredo.Account = Merkredo.Model.extend

  fullName: ( ->
    firstName = @get 'first_name'
    lastName  = @get 'last_name'
    if (!firstName && !lastName) then return null
    firstName + " " + lastName
  ).property 'first_name', 'last_name'


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
