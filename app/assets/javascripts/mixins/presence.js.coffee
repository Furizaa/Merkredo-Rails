Merkredo.Presence = Em.Mixin.create

  blank: (name) ->
    prop = @[name] || @get 'name'
    if !prop then return true

    switch (typeof prop)
      when "string" then return prop.trim().isBlank()
      when "object" then return Object.isEmpty(prop)

    false


  present: (name) ->
    !@blank name

