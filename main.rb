require 'Qt'

require 'bundler'
Bundler.require
require 'active_support/core_ext'

require './lib/application_config'
require './lib/project'
require './lib/text_edit'
require './lib/sidebar'

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

ApplicationConfig.instance

class Window < Qt::Widget
  def initialize
    super

    @text_edit = TextEdit.new
    @sidebar = Sidebar.new

    Qt::Object.connect(@sidebar.file_view, SIGNAL('clicked(const QModelIndex &)'), @sidebar, SLOT('clicked_wrap(const QModelIndex &)'))
    Qt::Object.connect(@sidebar, SIGNAL('send_fileview_clicked_signal(const QString &)'), @text_edit, SLOT('view_file(const QString &)'))

    layout = Qt::HBoxLayout.new do |l|
      l.add_layout @sidebar.layout, 1
      l.add_layout @text_edit.layout, 2
    end
    setLayout layout
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

app = Qt::Application.new(ARGV)
t = MainWindow.new
t.show()
app.exec()
