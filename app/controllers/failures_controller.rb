class FailuresController < ApplicationController
  def index
    @failures = Failure.includes(:environment).all
  end
end
