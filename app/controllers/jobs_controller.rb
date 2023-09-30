class JobsController < ApplicationController
  before_action :set_default_response_format

  def index
    @jobs = Job.all
  end

  private

  def set_default_response_format
    request.format = :json
  end
end
