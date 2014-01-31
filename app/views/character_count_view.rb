# coding: utf-8

class CharacterCountView < Qt::Label
  def initialize
    super
    setObjectName('CharacterCount')
  end

  def layout
    l = Qt::HBoxLayout.new do |l|
      l.add_stretch 1
      l.add_widget self
      l.add_stretch 1
    end

    l
  end
end
