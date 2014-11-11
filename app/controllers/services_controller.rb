class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def create
    @service = Service.create!(application_params)
  end

  def destroy
    Service.find(params[:id]).destroy!
    render json: {}
  end

  private

  def application_params
    params.require(:service).permit(:name)
  end
end
