# coding: utf-8

class MainWindowView < Qt::Widget
  def initialize
    super
    setObjectName('MainWindow')
  end

  def layout(widgets)
    l = Qt::HBoxLayout.new do |l|
      l.add_layout widgets[:TextEdit].layout
    end

    setLayout l
  end
end
