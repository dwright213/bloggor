class BlogPusher < ActiveModel::Pusher
  def channel(event)
    "blog"
  end
  events :created, :updated, :destroyed
end
