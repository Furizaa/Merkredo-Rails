Merkredo.debounce = (wait, func) ->
  timeout = null

  return ( ->
    context = @
    args = arguments

    later = ->
      timeout = null
      func.apply context, args

    if timeout then return

    if typeof wait == "function"
      currentWait = wait()
    else
      currentWait = wait;

    if timeout
      clearTimeout timeout

    timeout = setTimeout later, currentWait
    timeout
  )

Merkredo.debouncePromise = (wait, func) ->
  timeout = null
  args = null

  return ( ->
    context = @
    promise = Ember.Deferred.create()
    args = arguments

    if !timeout
      timeout = Em.run.later ->
        timeout = null
        func.apply(context, args).then (y) ->
          promise.resolve y
      , wait

    promise
  )