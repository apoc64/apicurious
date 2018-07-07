class RepoCollection
  attr_reader :repositories

  def initialize(attributes)
    @repositories = create_repositories(attributes)
  end

  def create_repositories(attributes)
    attributes.map do |repo_attributes|
      Repository.new(repo_attributes)
    end
  end
end
