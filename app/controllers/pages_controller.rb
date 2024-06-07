class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :dashboard ]

  def home
  end

  def dashboard
    @nb_streak = 0
    loop do
      if UserProgress.where(user: current_user, completed: true).where("DATE (created_at) = ?", Date.today- @nb_streak).empty?
        break
      else
        @nb_streak += 1
      end
    end
  end
end
