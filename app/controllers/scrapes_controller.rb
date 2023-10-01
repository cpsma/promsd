class ScrapesController < ApplicationController
  before_action :set_default_response_format

  def index
    @scrapes = Scrape.includes(:stack, :service).order("stacks.name").order("services.name")
  end

  def create
    stack, service, target = Scrape.register(
      stack: params[:stack], service: params[:service], target: params[:target]
    )
    render json: { message: "Scrape registered for #{params[:target]} (#{params[:stack]}/#{params[:service]})" }
  rescue ActiveRecord::RecordNotUnique
    render json: { message: "Scrape already registered for #{params[:target]} (#{params[:stack]}/#{params[:service]})"}
  rescue ServiceNotImplementedError
    render json: { message: "The service '#{params[:service]}' has not been implemented" }
  end

  private

  def set_default_response_format
    request.format = :json
  end
end
