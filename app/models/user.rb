class User < ApplicationRecord
  # Devise removed: authentication handled externally or not required

  has_many :dogs, dependent: :destroy
  has_many :chats, dependent: :destroy
end
