class User < ApplicationRecord
  has_many :repositories

  BASE_URI = 'https://api.github.com/users'
  def self.user_create(name)
    User.create(username: name)
  end
end
