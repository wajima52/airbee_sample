class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bedroom_number, presence: true
  validates :bathroom_number, presence: true
  validates :price, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true


  HOME_TYPE = ['マンション・アパート', '住宅', 'サブユニット']
  ROOM_TYPE = ['まるまる貸し切り', '個室', 'シェアルーム']
  has_one_attached :image

end
