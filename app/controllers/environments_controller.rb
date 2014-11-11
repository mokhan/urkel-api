class EnvironmentsController < ApplicationController
  def index
    @environments = Environment.where(id: params[:ids])
  end

  def show
    @environment = Environment.find(params[:id])
  end
end
