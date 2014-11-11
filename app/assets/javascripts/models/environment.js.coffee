App.Environment = DS.Model.extend
  name: DS.attr('string')
  apiKey: DS.attr('string')
  service: DS.belongsTo('service')
