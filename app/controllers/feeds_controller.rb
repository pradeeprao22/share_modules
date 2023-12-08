class FeedsController < ApplicationController
  before_action :authenticate_user!

  def index
    @feeds = Feed.all
  end

  def create
    @feed = Feed.new(feeds_params)
    return unless @feed.save

    flash[:notice] = 'Feeds created'
  end

  def new
    @feed = Feed.new
  end

  private

  def feeds_params
    params.permit :user_id, :post_id, :feedable_id, :feedable_type
  end
end
