class FileView < Qt::TreeWidget
  def initialize
    super
  end
end

class Sidebar
  def initialize
    super

    @file_view = FileView.new
    item = Qt::TreeWidgetItem.new
    item.setText 0, 'foo'
    @file_view.addTopLevelItem item
    #@file_view.setColumnCount 1
  end

  def layout
    Qt::VBoxLayout.new do |l|
      l.add_widget @file_view
    end
  end
end
