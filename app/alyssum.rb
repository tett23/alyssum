# coding: utf-8

class App
  include Singleton

  def initialize
    @view_models = {}
    @view_models[:MainWindow] = MainWindowViewModel.new
    @view_models[:TextEdit] = TextEditViewModel.new
  end

  def exec
    self[:MainWindow].layout!

    self
  end

  def show
    self[:MainWindow].show()
  end

  def widgets
    @view_models.reject do |k, _|
      k == :MainWindow
    end
  end

  def [](key)
    @view_models[key]
  end
end
