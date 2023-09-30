class ScrapesController < ApplicationController
  before_action :set_default_response_format

  def index
    @scrapes = Scrape.includes(:stack, :service).order("stacks.name").order("services.name")
  end

  private

  def set_default_response_format
    request.format = :json
  end
end
