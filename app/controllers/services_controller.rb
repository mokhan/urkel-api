class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def create
    @service = Service.create!(service_params)
  end

  def update
    @service = Service.find(params[:id])
    @service.update!(service_params)
  end

  def destroy
    Service.find(params[:id]).destroy!
    render json: {}
  end

  private

  def service_params
    params.require(:service).permit(:name)
  end
end
