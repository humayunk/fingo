module CoursesHelper
  def lesson_button(lesson, index, enrollment)
    if enrollment
      if !lesson.user_progresses.for(current_user).nil?
        if !lesson.user_progresses.for(current_user).completed
        # si lecon déjà commencée mais pas fini
          link_to lesson_path(lesson), class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center lesson-active" do
            content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson" ) +
            content_tag(:span, "➡️", class: "emoji-lesson")
          end
        else
          # si lecon deja finie, veut revoir
          link_to lesson_path(lesson), class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center lesson-disabled" do
            content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson") +
            content_tag(:span, "✅", class: "emoji-lesson")
          end
        end
      elsif lesson.order_rank <= enrollment.active_lesson
        # lecon n2 ou 3 ou suite, débloquée après avoir fait la première
        button_to lesson_user_progresses_path(lesson), method: :post, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center lesson-active" do
          content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson") +
          content_tag(:span, "👋", class: "emoji-lesson")
        end
      else
        link_to root_path, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center disabled lesson-disabled" do
          content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson") +
          content_tag(:span, "🔒", class: "emoji-lesson")
        end
      end
    elsif enrollment.nil? && index == 0
      # lecon n1 pour débloquer la lecon 2
      button_to course_enrollments_path(lesson.course), method: :post, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center lesson-active" do
        content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson") +
        content_tag(:span, "👋", class: "emoji-lesson")
      end
    else
      link_to root_path, class: "list-group-item list-group-item-action d-flex justify-content-between align-items-center disabled lesson-disabled" do
        content_tag(:span, "#{sprintf('%02d', index + 1)}  #{lesson.title}", class: "title-lesson") +
        content_tag(:span, "🔒", class: "emoji-lesson")
      end
    end
  end
end
