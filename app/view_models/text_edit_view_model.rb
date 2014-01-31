# coding: utf-8

class TextEditViewModel < Alyssum::ViewModel
  def initialize
    super

    observe(TextEditView)
    observe(CharacterCountView)

    self
  end

  def layout
    l = Qt::VBoxLayout.new do |l|
      l.add_layout @views[:TextEdit].layout
      l.add_layout @views[:CharacterCount].layout
    end
    l
  end
end
