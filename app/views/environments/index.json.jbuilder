json.environments @environments do |environment|
  json.partial! environment, environment: environment
end
