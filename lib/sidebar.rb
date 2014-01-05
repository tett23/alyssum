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
end

class Sidebar < Qt::Object
  signals 'send_fileview_clicked_signal(int)'
  slots 'clicked_wrap(const QModelIndex &)', 'new_file()'

  attr_reader :file_view, :projects

  def initialize
    super

    @file_view = FileView.new
    @projects = []

    load_all_files()
  end

  def load_all_files
    Body.all.each do |body|
      add_item(body)
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
    body_id = @file_view.itemFromIndex(index).text(1).to_i

    emit send_fileview_clicked_signal(body_id)
  end

  def add_item(body)
    item = Qt::TreeWidgetItem.new(@file_view)
    item.setText(0, tr(body.title))
    item.setText(1, body.id.to_s)
    item.setFlags(Qt::ItemIsSelectable | Qt::ItemIsUserCheckable | Qt::ItemIsEnabled | Qt::ItemIsDragEnabled | Qt::ItemIsEditable)
    @file_view.addTopLevelItem(item)

    item
  end
end
