class FileView < Qt::TreeWidget
  slots 'rename()', 'renamed(QTreeWidgetItem *, int)'

  def initialize
    super
    setObjectName("sidebar")

    context_menu = Qt::Menu.new(self)
    self.setContextMenuPolicy(Qt::ActionsContextMenu)
    rename_action = Qt::Action.new('rename', context_menu)
    self.add_action(rename_action)
    connect(rename_action, SIGNAL('triggered()'), self, SLOT('rename()'))
    connect(self, SIGNAL('itemChanged(QTreeWidgetItem *, int)'), self, SLOT('renamed(QTreeWidgetItem *, int)'))
  end

  def rename()
    item = selectedItems.first
    editItem(item)
  end

  def renamed(item, col)
    body = Body.get(item.text(1).to_i)
    return if body.nil?

    body.update(title: item.text(0))
  end

  def find_project(project_id)
    self.find do |item|
      item.text(1) == project_id.to_s
    end
  end

  def body?(index)
    itemFromIndex(index).class == BodyItem
  end
end

class BodyItem < Qt::TreeWidgetItem
end

class ProjectItem < Qt::TreeWidgetItem
end

class Sidebar < Qt::Object
  signals 'send_fileview_clicked_signal(int)', 'project_added(int)'
  slots 'clicked_wrap(const QModelIndex &)', 'new_file()'

  attr_reader :file_view, :projects

  def initialize
    super

    @file_view = FileView.new
    @projects = []

    load_all_files()
  end

  def load_all_files
    add_project(0)
    Project.all.each do |project|
      add_project(project.id)
    end
    Body.all.each do |body|
      add_body(body.project_id, body.id)
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
    if @file_view.body?(index)
      body_id = @file_view.itemFromIndex(index).text(1).to_i
      emit send_fileview_clicked_signal(body_id)
    else
      emit @file_view.expandItem(@file_view.itemFromIndex(index))
      emit @file_view.itemExpanded(@file_view.itemFromIndex(index))
      @file_view.itemFromIndex(index).setExpanded(true)
    end
  end

  def add_item(body)
    item = Qt::TreeWidgetItem.new(@file_view)
    item.setText(0, tr(body.title))
    item.setText(1, body.id.to_s)
    item.setFlags(Qt::ItemIsSelectable | Qt::ItemIsUserCheckable | Qt::ItemIsEnabled | Qt::ItemIsDragEnabled | Qt::ItemIsEditable)
    @file_view.addTopLevelItem(item)

    item
  end

  def add_project(project_id)
    if project_id == 0
      name = 'undefined project'
    end
    project = Project.get(project_id)
    name = project.name unless project.nil?
    item = ProjectItem.new(@file_view)

    item.setText(0, tr(name))
    item.setText(1, project_id.to_s)
    item.setFlags(Qt::ItemIsSelectable | Qt::ItemIsUserCheckable | Qt::ItemIsEnabled | Qt::ItemIsDragEnabled | Qt::ItemIsEditable)
    @file_view.addTopLevelItem(item)
  end

  def add_body(project_id, body_id)
    project_id = 0 if project_id.nil?
    body = Body.get(body_id)
    raise '' if body.nil?

    project = @file_view.find_project(project_id)
    return if project.nil?

    item = BodyItem.new(@file_view)
    item.setText(0, tr(body.title))
    item.setText(1, body.id.to_s)
    item.setFlags(Qt::ItemIsSelectable | Qt::ItemIsUserCheckable | Qt::ItemIsEnabled | Qt::ItemIsDragEnabled | Qt::ItemIsEditable)
    project.add_child(item)
  end

  def project_added(project_id)
    item = add_project(project_id)
  end
end
