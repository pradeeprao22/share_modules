module FeedModule
  extend ActiveSupport::Concern
  def feed_creation(post_id, user_id)
    @feed = Feed.new(post_id:, user_id:)
    return unless @feed.save!

    puts feed created
  end

  def fetch_feed
    @feed = Feed.include(:post)
    @feed.map do |feed|
      puts "#{feed.post.user} posted this #{feed.post.content}"
    end
  end
end
