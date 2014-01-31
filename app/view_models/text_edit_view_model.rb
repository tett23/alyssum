# coding: utf-8

class TextEditViewModel < Alyssum::ViewModel
  slots 'update_character_count(int)'

  def initialize
    super

    observe(TextEditView)
    observe(CharacterCountView)

    connect(@views[:TextEdit], SIGNAL('count_characters(int)'), self, SLOT('update_character_count(int)'))
    @views[:TextEdit].emit @views[:TextEdit].count_characters(0)

    self
  end

  def layout
    l = Qt::VBoxLayout.new do |l|
      l.add_layout @views[:TextEdit].layout
      l.add_layout @views[:CharacterCount].layout
    end
    l
  end

  def update_character_count(count)
    @views[:CharacterCount].text = character_count_text(count)
  end

  def character_count_text(count)
    'character count: ' + count.to_s
  end
end
