class Annotation < Qt::TextEdit
  def initialize
    super
    setObjectName('annotation')
  end

  def open_file(body_id)
    Body.get(@opening_body_id).update(annotation: self.plainText) unless @opening_body_id.nil?

    @opening_body_id = body_id
    self.text = Body.get(body_id).annotation
  end
end
