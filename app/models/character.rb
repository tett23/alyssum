class Character
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  belongs_to :project
  has n, :character_flagments
end
