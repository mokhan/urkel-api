App.Environment = DS.Model.extend
  name: DS.attr('string')
  service: DS.belongsTo('service')
