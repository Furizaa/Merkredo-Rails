window.Merkredo = Merkredo = Ember.Application.create
  rootElement: '#main'

  ajax: ->
    if 1 == arguments.length
      if typeof arguments[0] == "string"
        url = arguments[0]
        args = {}
      else
        args = arguments[0]
        url = args.url
        delete args.url
    else if 2 == arguments.length
      url = arguents[0]
      args = arguments[1]

    Ember.Deferred.promise (promise) ->
      oldSuccess = args.success
      args.success = (xhr) ->
        Ember.run promise, promise.resolve, xhr
        oldSuccess xhr if oldSuccess

      oldError = args.error
      args.error = (xhr) ->
        if xhr.status == 200 then return args.success xhr
        promise.reject xhr
        oldError xhr if oldError

      args.type = 'GET' unless args.type
      args.dataType = 'json' if !args.dataType and args.type == 'GET'

      $.ajax url, args

