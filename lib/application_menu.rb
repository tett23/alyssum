module ApplicationMenu
  def bootup_menu
    build_file_menu()
    build_project_menu()
  end

  private
  def build_file_menu
    file = menuBar().addMenu '&File'

    quit = Qt::Action.new '&Quit', self
    new_file = Qt::Action.new 'New File', self
    file.addAction quit
    file.addAction new_file

    connect(quit, SIGNAL('triggered()'), Qt::Application.instance, SLOT('quit()'))
    connect(new_file, SIGNAL('triggered()'), @windows.first.sidebar, SLOT('new_file()'))
  end

  def build_project_menu
    project = menuBar().addMenu '&Project'

    new_project = Qt::Action.new 'New Project', self
    project.addAction new_project

    connect(new_project, SIGNAL('triggered()'), NewPorjectDialog.new, SLOT('exec()'))
    new_project.setShortcut(Qt::KeySequence.new(Qt::CTRL + Qt::SHIFT + Qt::Key_N))
  end
end
