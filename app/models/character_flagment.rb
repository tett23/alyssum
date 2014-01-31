class CharacterFlagment
  include DataMapper::Resource

  property :id, Serial
  property :answer, Text

  belongs_to :character_flagment_master
  belongs_to :character
end
