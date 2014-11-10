json.videos do
  json.array! @videos do |video|
    json.partial! video, video: video
  end
end
