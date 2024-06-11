module CoursesHelper
  def lesson_button(lesson, index, enrollment)
    if enrollment
      if !lesson.user_progresses.for(current_user).nil?
        if !lesson.user_progresses.for(current_user).completed
        # si lecon déjà commencée mais pas fini
          link_to lesson_path(lesson), class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center" do
            content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") +
            content_tag(:button, "Continue lesson", type: "button", class: "btn btn-primary float-end btn-sm")
          end
        else
          # si lecon deja finie, veut revoir
          link_to lesson_path(lesson), class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center" do
            content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") +
            content_tag(:button, "Review lesson", type: "button", class: "btn btn-primary float-end btn-sm")
          end
        end
      elsif lesson.order_rank <= enrollment.active_lesson
        # lecon n2 ou 3 ou suite, débloquée après avoir fait la première
        button_to lesson_user_progresses_path(lesson), method: :post, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center" do
          content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") +
          content_tag(:div, "Start lesson", class: "btn btn-primary mx-2")
        end
      else
        link_to root_path, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center disabled" do
          content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") + tag.i(class: "fas fa-lock")
        end
      end
    elsif enrollment.nil? && index == 0
      # lecon n1 pour débloquer la lecon 2
      button_to course_enrollments_path(lesson.course), method: :post, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center" do
        content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") +
        content_tag(:div, "Start lesson", class: "btn btn-primary mx-2")
      end
    else
      link_to root_path, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center disabled" do
        content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}") + tag.i(class: "fas fa-lock")
      end
    end
  end
end
