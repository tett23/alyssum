# coding: utf-8

require 'Qt'

require 'bundler'
Bundler.require
require 'active_support/core_ext'

require './lib/application_config'
require './lib/project'
require './lib/text_edit'
require './lib/sidebar'
require './lib/annotation'
require './lib/description'
require './lib/application_menu'
require './lib/new_project_dialog'
require './models/project'
require './models/body'
require './models/character_flagment'
require './models/character_flagment_master'
require './models/character'

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
  attr_reader :sidebar, :text_edit
  def initialize
    super

    @text_edit = TextEdit.new
    @sidebar = Sidebar.new

    Qt::Object.connect(@sidebar.file_view, SIGNAL('clicked(const QModelIndex &)'), @sidebar, SLOT('clicked_wrap(const QModelIndex &)'))
    Qt::Object.connect(@sidebar, SIGNAL('send_fileview_clicked_signal(int)'), @text_edit, SLOT('view_file(int)'))

    layout = Qt::HBoxLayout.new do |l|
      l.add_layout @sidebar.layout, 1
      l.add_layout @text_edit.layout, 2
    end
    setLayout layout
  end
end

class MainWindow < Qt::MainWindow
  include ApplicationMenu

  slots :create_file

  def initialize
    super

    DataMapper.setup(:default, 'sqlite://'+File.expand_path(ApplicationConfig[:db_path]))
    DataMapper.auto_upgrade!
    DataMapper.finalize
    setStyleSheet(File.read(File.expand_path(ApplicationConfig[:style_template])))

    @windows = []
    @windows << Window.new

    self.window_title = 'alyssum'
    resize(ApplicationConfig[:width], ApplicationConfig[:height])
    move(geometry.center())
    bootup_menu()

    setCentralWidget(@windows.first)
  end

  def closeEvent(e)
  end
end

app = Qt::Application.new(ARGV)
t = MainWindow.new
t.show()
app.exec()
