App.Service = DS.Model.extend
  name: DS.attr('string')

App.Service.reopenClass
  valid: (fields) ->
    fields.name
