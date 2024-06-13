module StepsHelper
  REGEX = /(?=_{6})|(?<=_{6})/
  DELIMITER = "______"
  def build_fill_step(content)
    content.split(REGEX).map do |part|
      if part == DELIMITER
        "<div class='answer-disabled' 'answer-fill' data-answer-target='blank' ondragover='allowDrop(event)' ondrop='drop(event)' data-fill-role='destination'>#{part}</div>"
      else
        "<span class='text-part''>#{part}</span>"
      end
    end.join
  end
end
