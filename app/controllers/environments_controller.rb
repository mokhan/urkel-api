class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.where(id: params[:ids])
  end

  def show
    @environment = Environment.find(params[:id])
  end

  def create
    service = Service.find(params[:environment][:service_id])
    @environment = service.environments.create!(environment_params)
  end

  private

  def environment_params
    params.require(:environment).permit(:name)
  end
end
