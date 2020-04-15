class Translate
  attr_accessor :text, :language_from, :language_to

  def initialize(text, language_from, language_to)
    @text = text
    @language_from = language_from
    @language_to = language_to
  end
end
