class Movie < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, format: /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :user_id,  presence: true

  after_create :notify_to_all_users

  private

  def notify_to_all_users
    ActionCable.server.broadcast('notifications_channel', {
      user_id: user.id,
      message: "#{user.email} shared a new video: #{title}"  
    })
  end
end
