window.ServerStore = ServerStore =
  data: {}

  store: (key, value) ->
    @data[key] = value

  "get": (key) ->
    @data[key]

  remove: (key) ->
    if @data[key] then delete @data[key]

