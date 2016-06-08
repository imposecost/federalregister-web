class SearchSuggestion::Citation < Citation
  include SearchSuggestion::Shared

  attr_reader :conditions

  def initialize(options, conditions)
    @conditions = conditions
    super(options)
  end

  def name
    conditions["term"]
  end
end
