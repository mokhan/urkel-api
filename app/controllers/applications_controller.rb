class ApplicationsController < ApplicationController
  def index
    @applications = Application.all
  end

  def create
    Application.create!(application_params)
    render nothing: true
  end

  private

  def application_params
    params.require(:application).permit(:name)
  end
end
