class VideosController < ApplicationController
  def index
    @videos = [
      OpenStruct.new(id: 1, title: 'getting jiggy with it', description: 'supa fly funky dancing'),
      OpenStruct.new(id: 2, title: 'getting jiggy with it', description: 'supa fly funky dancing'),
    ]
  end

  def create
    raise "heck"
  end
end
