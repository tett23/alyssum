class NewPorjectDialog < Qt::Dialog
  slots :accepted, :rejected

  def initialize
    super
    setObjectName('newProjectDialog')
    setWindowTitle('New Project')

    center()

    @project_name = Qt::LineEdit.new(self)
    @accept_button = Qt::PushButton.new('create', self)
    @reject_button = Qt::PushButton.new('cancel', self)

    connect(@accept_button, SIGNAL('clicked()'), self, SLOT('accepted()'))
    connect(@reject_button, SIGNAL('clicked()'), self, SLOT('rejected()'))

    layout()
  end

  def layout
    l = Qt::VBoxLayout.new do |l|
      l.add_layout Qt::VBoxLayout.new { |l|
        l.add_widget(@project_name)
      }
      l.add_layout Qt::HBoxLayout.new { |l|
        l.add_widget(@accept_button)
        l.add_widget(@reject_button)
      }
    end

    setLayout(l)
  end

  def center
    main_window = Qt::Application.topLevelWidgets().find do |w|
      w.class == MainWindow
    end
    move(main_window.geometry.center)
  end

  def accepted()
    #project = Project.create(@project_name.text)
    #project.id
    main_window = Qt::Application.topLevelWidgets().find do |w|
      w.class == MainWindow
    end

  end

  def rejected()
    close()
  end
end
