App.Application = DS.Model.extend
  name: DS.attr('string')

App.Application.reopenClass
  valid: (fields) ->
    fields.name
