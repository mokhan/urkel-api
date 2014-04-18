json.videos do
  json.array! @videos do |video|
    json.id video.id
    json.title video.title
    json.description video.description
  end
end
