App.Video = DS.Model.extend
  title: DS.attr('string')
  description: DS.attr('string')
  uri: DS.attr('string')

App.Video.reopenClass
  valid: (fields) ->
    fields.title and fields.uri
