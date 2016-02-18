class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  after_save :update_post_most_recent

  validates :reply,   presence: true, length: { minimum: 2 }
  validates :user_id, presence: true
  validates :post_id, presence: true


  private

	  def update_post_most_recent
	  	self.post.touch(:most_recent) if self.post
	  end
end
