# coding: utf-8

class TextEditView < Qt::TextEdit
  def initialize
    super
    setObjectName('TextEdit')
  end

  def layout
    l = Qt::HBoxLayout.new do |l|
      l.add_widget self
    end

    l
  end
end
