class FileView < Qt::TreeView
  def initialize
    super
  end
end

class Sidebar < Qt::Object
  signals 'send_fileview_clicked_signal(const QString &)'
  slots 'clicked_wrap(const QModelIndex &)'

  attr_reader :file_view, :projects

  def initialize
    super

    @file_view = FileView.new
    @projects = []
    @projects << Project.new('./')

    @projects.each do |project|
      @file_view.setModel(project.model)
      @file_view.setRootIndex(project.model.setRootPath(project.dir))
    end
  end

  def layout
    Qt::VBoxLayout.new do |l|
      @file_view.setSizePolicy(Qt::SizePolicy.new(Qt::SizePolicy::Preferred, Qt::SizePolicy::Preferred))
      @file_view.setMinimumWidth(100)
      l.add_widget @file_view
    end
  end

  def clicked_wrap(index)
    path = projects.map do |project|
      project.model.filePath(index)
    end.compact.first

    emit send_fileview_clicked_signal(path)
  end
end
