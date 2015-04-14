class Blog < ActiveRecord::Base
  has_many :comments
  validates :title, :presence => true
  validates :body, :presence => true

  def channel
    "blogs"
  end
end
