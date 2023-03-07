class Repository < ApplicationRecord
  belongs_to :user


  def self.repository_create(result)
    JSON.parse(result).each do |repository|
      # byebug
      @user = User.find_by(username:repository["owner"]["login"])
      Repository.create(repository_name:repository["name"],
                        stargazers_count:repository["stargazers_count"],
                        user_id:@user[:id])
    end
    @user.repositories
  end
end
