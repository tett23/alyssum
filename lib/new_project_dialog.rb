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
    move(Qt::Application.main_window.geometry.center)
  end

  def accepted()
    project = Project.create(name: @project_name.text)
    Qt::Application.main_window.emit_all_children(:sidebar, :project_added, project.id)

    close()
  end

  def rejected()
    close()
  end
end
