class Project
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :bodys
  has n, :characters
end
