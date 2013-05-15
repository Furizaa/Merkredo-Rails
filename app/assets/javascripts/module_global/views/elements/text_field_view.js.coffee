Merkredo.TextField = Ember.TextField.extend
  placeholder: (->
    if @get 'placeholderKey'
      Em.String.i18n @get('placeholderKey')
    else
      ''
    ).property 'placeholderKey'