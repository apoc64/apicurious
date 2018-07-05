class Profile
  attr_reader :avatar,
              :name,
              :login,
              :bio,
              :location,
              :email,
              :public_repos,
              :followers,
              :following,
              :starred_url

  def initialize(attributes)
    @avatar = attributes[:avatar_url]
    @name = attributes[:name]
    @login = attributes[:login]
    @bio = attributes[:bio]
    @location = attributes[:location]
    @email = attributes[:email]
    @public_repos = attributes[:public_repos]
    @followers = attributes[:followers]
    @following = attributes[:following]
    # binding.pry
    @starred_url = attributes[:starred_url]
  end
end
