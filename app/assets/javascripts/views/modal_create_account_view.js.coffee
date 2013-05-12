Merkredo.CreateAccountView = Merkredo.ModalBodyView.extend

  templateName: 'create_account'
  title: Em.String.i18n 'account.create.title'

  uniqueEmailValidation: null
  formSubmitted: false

  submitDisabled: ( ->
    return true if @get 'formSubmitted'
    return true if @get 'emailValidation.failed'
    return true if @get 'passwordValidation.failed'
    return true if @get 'passwordConfirmValidation.failed'
    false
  ).property 'formSubmitted',
             'emailValidation.failed',
             'passwordValidation.failed',
             'passwordConfirmValidation.failed'

  createAccount: ->
    @set 'formSubmitted', true
    ajax = Merkredo.Account.createAccount @get('accountEmail'), @get('accountPassword')
    ajax.then (result) =>
      if result.success
        @flash '', 'success'
        #window.location.reload()
      else
        @set 'formSubmitted', false
        @flash result.message || 'account.create.action.failed', 'alert'

    ,() =>
      @set 'formSubmitted', false
      @flash 'account.create.action.failed', 'alert'


  basicEmailValidation: ( ->
    @set 'uniqueEmailValidation', null

    if @blank 'accountEmail'
      return Merkredo.InputValidation.create
        failed: true

    email = @get 'accountEmail'

    unless Merkredo.Utils.emailValid email
      return Merkredo.InputValidation.create
        failed: true
        reason: Em.String.i18n 'account.create.email.invalid'

    @checkEmailAvailability()
    Merkredo.InputValidation.create
      failed: true
      reason: Em.String.i18n 'account.create.email.checking'

  ).property 'accountEmail'


  passwordValidation: ( ->
    if @blank 'accountPassword'
      return Merkredo.InputValidation.create
        failed: true

    pass = @get 'accountPassword'

    if pass.length < 6
      return Merkredo.InputValidation.create
        failed: true
        reason: Em.String.i18n 'account.create.password.to_short'

    Merkredo.InputValidation.create
      ok: true
      reason: Em.String.i18n 'account.create.password.ok'
  ).property 'accountPassword'


  passwordConfirmValidation: ( ->
    if @blank 'accountPasswordConfirmation'
      return Merkredo.InputValidation.create
        failed: true

    # Fail without reason if password is invalid
    if @get 'passwordValidation.failed'
      return Merkredo.InputValidation.create
        failed: true

    pass = @get 'accountPassword'
    passconf = @get 'accountPasswordConfirmation'

    if pass == passconf
      return Merkredo.InputValidation.create
        ok: true
        reason: Em.String.i18n 'account.create.password_confirmation.ok'
    else
      return Merkredo.InputValidation.create
        failed: true
        reason: Em.String.i18n 'account.create.password_confirmation.no_match'
  ).property 'accountPasswordConfirmation'


  emailValidation: ( ->
    basicValidation = @get 'basicEmailValidation'
    uniqueValidation = @get 'uniqueEmailValidation'
    if uniqueValidation
      return uniqueValidation
    basicValidation
  ).property 'uniqueEmailValidation', 'basicEmailValidation'


  checkEmailAvailability: Merkredo.debounce 500, ->
    checkCall = Merkredo.Account.checkEmail @get('accountEmail')
    checkCall.then (result) =>
      if result.available
        @set 'uniqueEmailValidation', Merkredo.InputValidation.create
          ok: true
          reason: Em.String.i18n 'account.create.email.available'
      else
        @set 'uniqueEmailValidation', Merkredo.InputValidation.create
          failed: true
          reason: Em.String.i18n 'account.create.email.not_available'




