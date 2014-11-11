class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def create
    Service.create!(application_params)
  end

  private

  def application_params
    params.require(:service).permit(:name)
  end
end
