require 'Qt'

require './lib/text_edit'

#Qt.debug_level = Qt::DebugLevel::High

class Object
  def to_variant
    Qt::Variant.new object_id
  end
end

class Qt::Variant
  def to_object
    ObjectSpace._id2ref to_int
  end
end

class Window < Qt::Widget
  def initialize
    super

    @text_edit = TextEdit.new

    setLayout @text_edit.layout
=begin
    setLayout Qt::VBoxLayout.new { |l|
      l.add_widget Qt::TextEdit.new

      q_button = Qt::PushButton.new 'quit' do
        connect SIGNAL(:clicked) do
          Qt::Application.instance.quit()
        end
      end
      l.add_widget q_button
    }
=end
  end
end

class MainWindow < Qt::MainWindow
  def initialize
    super

    @windows = []
    @windows << Window.new

    self.window_title = 'alyssum'
    resize(500, 300)

    setCentralWidget(@windows.first)
  end
end

class Sidebar
  def initialize
    super

    setLayout Qt::VBoxLayout.new {

    }
  end
end

app = Qt::Application.new(ARGV)
t = MainWindow.new
t.show()
app.exec()
