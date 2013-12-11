class Body
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text
  property :folder, String
  property :description, Text
  property :annotation, Text


  belongs_to :project, required: false
end
