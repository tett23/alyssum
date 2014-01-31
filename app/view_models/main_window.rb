# coding: utf-8

class MainWindowViewModel < Qt::MainWindow
  def initialize
    super
  end

  def layout!
    view = MainWindowView.new
    view.layout(App.instance.widgets)

    setCentralWidget view
  end
end
