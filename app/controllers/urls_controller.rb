# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :stats]

  def create
    @url = Url.new(url_params)

    if @url.save
      render json: { short_url: @url.short_url }
    else
      render json: { error: 'Не удалось сократить URL' }, status: :unprocessable_entity
    end
  end

  def all_urls
    render json: { urls: Url.all_urls_formatted }
  end

  def index; end

  def show
    @url.increment_clicks
    render json: { original_url: @url.original_url }
  end

  def stats
    render json: { clicks: @url.clicks }
  end

  private

  def set_url
    @url = Url.find_by_short_url(params[:short_url])
    render json: { error: 'Длинный URL не найден' }, status: :not_found unless @url
  end

  def url_params
    params.permit(:original_url)
  end
end
