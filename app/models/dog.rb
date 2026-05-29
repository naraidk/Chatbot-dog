class Dog < ApplicationRecord
  belongs_to :user

  has_many :chats, dependent: :destroy
  has_one_attached :photo # [photo upload](ca://s?q=Add_photo_to_Dog_model)
  validates :name, presence: true
  validates :breed, presence: true
end
