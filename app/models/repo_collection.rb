class RepoCollection
  attr_reader :repositories

  def initialize(attributes)
    # binding.pry
    @repositories = create_repositories(attributes)
  end

  def create_repositories(attributes)
    # binding.pry
    attributes.map do |repo_attributes|
      Repository.new(repo_attributes)
    end
  end
end
