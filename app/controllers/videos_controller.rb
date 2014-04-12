class VideosController < ApplicationController
  def index
    render json: [
      {
        id: 1,
        title: 'getting jiggy with it',
        description: 'supa fly funky dancing'
      },
      {
        id: 2,
        title: 'getting jiggy with it',
        description: 'supa fly funky dancing'
      },
    ]
  end

  def show
    render json: { id: 1, title: 'getting jiggy with it', description: 'supa fly funky dancing' }
  end
end
