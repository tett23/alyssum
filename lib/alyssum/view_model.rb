# coding: utf-8

module Alyssum
  class ViewModel < Qt::Object
    def initialize
      super

      @views = {}
    end

    def observe(view_class)
      view = view_class.new

      @views[view.objectName.to_sym] = view
    end
  end
end
