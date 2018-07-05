class Github
  def initialize(token)
    @token = token
  end

  def profile(name)
    profile_data = parse(get("users/#{name}"))
    Profile.new(profile_data)
  end

  def repositories(name)
    repos_data = parse(get("users/#{name}/repos"))
    RepoCollection.new(repos_data)
  end

  def get(resource)
    Faraday.get("https://api.github.com/#{resource}?access_token=#{@token}").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
# user = current_user
# user_response = Faraday.get("https://api.github.com/users/#{user.username}?access_token=#{user.oauthtoken}")
# @profile = JSON.parse(user_response.body)
# repo_response = Faraday.get("https://api.github.com/users/#{user.username}/repos?access_token=#{user.oauthtoken}")
# @repos = JSON.parse(repo_response.body)
