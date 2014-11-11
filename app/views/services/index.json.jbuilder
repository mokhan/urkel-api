json.services @services do |service|
  json.id service.id
  json.name service.name
  json.environments service.environments.pluck(:id)
end
