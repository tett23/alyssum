class TextArea < Qt::TextEdit
  signals 'count_characters(int)'

  def initialize
    super
    setObjectName("textArea")
  end

  def keyPressEvent(e)
    super(e)

    emit count_characters(self.plainText.size)
  end

  def open_file(body_id)
    Body.get(@opening_body_id).update(body: self.plainText) unless @opening_body_id.nil?

    @opening_body_id = body_id
    self.text = Body.get(body_id).body

    emit count_characters(self.plainText.size)
  end
end

#class LineNumbers < Qt::TextBlock
class LineNumbers < Qt::TextEdit
  def initialize
    super
    setObjectName("lineNumbers")
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
  slots 'view_file(int)'

  def initialize
    super

    @textarea = TextArea.new
    @line_numbers = LineNumbers.new
    @char_counter = CharCounter.new
    @annotation = Annotation.new
    Qt::Object.connect(@textarea, SIGNAL('count_characters(int)'), @char_counter, SLOT('update_count(int)'))
    @textarea.emit @textarea.count_characters(0)
  end

  def layout
    layout = Qt::VBoxLayout.new do |layout|
      annotation = Qt::HBoxLayout.new do |l|
        l.add_widget(@annotation)
      end

      text_area = Qt::HBoxLayout.new do |l|
        l.add_widget(@line_numbers)
        l.add_widget(@textarea)
      end

      char_count_widget = Qt::HBoxLayout.new do |l|
        l.add_stretch 1
        l.add_widget @char_counter
        l.add_stretch 1
      end

      main_area = Qt::VBoxLayout.new do |l|
        l.add_layout text_area
        l.add_layout char_count_widget
      end

      l = Qt::HBoxLayout.new { |l|
        l.add_layout main_area
        l.add_layout annotation
      }
      layout.add_layout l

      layout
    end

    layout
  end

  def view_file(body_id)
    @textarea.open_file(body_id)
    @annotation.open_file(body_id)
  end
end
