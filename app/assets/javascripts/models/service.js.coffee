App.Service = DS.Model.extend
  name: DS.attr('string')
  environments: DS.hasMany('environment', async: true)

App.Service.reopenClass
  valid: (fields) ->
    fields.name
