class ProfilePresenter
  extend Forwardable
  def_delegators :profile, :repos, :is_current, :token
  attr_reader :profile, :repos, :is_current, :token

  def initialize(param, current_user)
    @token = current_user.oauthtoken
    gh = Github.new(@token)
    if (param.to_i == current_user.id) || (param == current_user.username)
      name = current_user.username
      @is_current = true
    else
      name = param
      @is_current = false
    end
    @profile = gh.profile(name)
    @repos = gh.repositories(name).repositories
  end
end
