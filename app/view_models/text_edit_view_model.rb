# coding: utf-8

class TextEditViewModel < Alyssum::ViewModel

  def initialize
    super

    observe(TextEditView)
  end
end
