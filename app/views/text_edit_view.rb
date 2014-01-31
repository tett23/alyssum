# coding: utf-8

class TextEditView < Qt::TextEdit
  signals 'count_characters(int)'

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

  def keyPressEvent(e)
    super(e)

    emit count_characters(self.plainText.size)
  end
end
