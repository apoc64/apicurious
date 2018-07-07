class Repository
  attr_reader :name,
              :description,
              :language

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @language = attributes[:language]
  end
end
