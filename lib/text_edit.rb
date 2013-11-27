class TextArea < Qt::TextEdit
  signals 'count_characters(int)'

  def initialize
    super
  end

  def keyPressEvent(e)
    super(e)

    emit count_characters(self.plainText.size)
  end

  def open_file(path)
    raise '' unless File.exists?(path)
    return if File.directory?(path)
    text = open(path).read

    self.text = text
    emit count_characters(self.plainText.size)
  end
end

class CharCounter < Qt::Label
  slots 'update_count(int)'

  def initialize
    super
  end

  def update_count(count)
    self.text = "character count: #{count}"
  end
end

class TextEdit < Qt::Object
  slots 'view_file(const QString &)'

  def initialize
    super

    @textarea = TextArea.new
    @char_counter = CharCounter.new
    Qt::Object.connect(@textarea, SIGNAL('count_characters(int)'), @char_counter, SLOT('update_count(int)'))
    @textarea.emit @textarea.count_characters(0)
  end

  def layout
    Qt::VBoxLayout.new do |l|
      l.add_widget @textarea

      char_count_widget = Qt::HBoxLayout.new do |char_count_layout|
        char_count_layout.add_stretch 1
        char_count_layout.add_widget @char_counter
        char_count_layout.add_stretch 1
      end
      l.add_layout char_count_widget
    end
  end

  def view_file(path)
    @textarea.open_file(path)
  end
end
