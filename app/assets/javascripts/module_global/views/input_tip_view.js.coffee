Merkredo.InputTipView = Ember.View.extend
  templateName: 'input_tip'
  classNameBindings: [':tip', 'good', 'bad']

  good: (->
    !@get 'validation.failed'
  ).property 'validation'

  bad: (->
    @get 'validation.failed'
  ).property 'validation'

  triggerRender: (->
    @rerender()
  ).observes 'validation'

  render: (buffer) ->
    reason = @get 'validation.reason'
    if reason
      icon = if @get('good') then 'icon-ok' else 'icon-remove'
      buffer.push '<i class="icon ' + icon + '"></i>&nbsp;' + reason