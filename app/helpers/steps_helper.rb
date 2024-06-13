module StepsHelper
  REGEX = /(?=_{6})|(?<=_{6})/
  DELIMITER = "______"
  def build_fill_step(content)
    content.split(REGEX).map do |part|
      if part == DELIMITER
        "<div class='answer-disabled' data-answer-target='blank' ondragover='allowDrop(event)' ondrop='drop(event)' data-fill-role='destination'>#{part}</div>"
      else
        "<span>#{part}</span>"
      end
    end.join
  end
end

# sentence.split(/(?=_{6})|(?<=_{6})/)

# <div class="blank" data-answer-target="blank" ondragover="allowDrop(event)" ondrop="drop(event)">______</div>
