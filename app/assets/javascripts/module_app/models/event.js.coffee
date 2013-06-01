Merkredo.Event = Ember.Object.extend()

Merkredo.Event.reopenClass

  findAll: ->
    promise = Merkredo.ajax '/event'
    events = Em.A()
    promise.then (response) ->
      response.each (e) ->
        events.pushObject Merkredo.Event.create(e)
    events
