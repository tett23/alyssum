class Project
  attr_reader :model, :dir

  def initialize(dir)
    raise '' unless Dir.exists?(dir)

    @dir = File.expand_path(dir)
    @model = Qt::FileSystemModel.new
  end
end
