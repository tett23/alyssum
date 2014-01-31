# coding: utf-8

class Alyssum
  include Singleton

  def initialize
    @view_models = {}
    @view_models[:MainWindow] = MainWindowViewModel.new
  end

  def self.show
    Alyssum.instance[:MainWindow].show()
  end

  def [](key)
    @view_models[key]
  end
end
