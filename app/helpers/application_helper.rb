module ApplicationHelper

  def vote_score(value)
    number_with_precision value, precision: 1
  end

  def log_debug(text)
    Rails.logger.debug(text)
  end

end
