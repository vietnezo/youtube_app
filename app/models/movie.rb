class Movie < ApplicationRecord
  belongs_to :user

  validates :url, presence: true, format: /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :user_id,  presence: true
end
