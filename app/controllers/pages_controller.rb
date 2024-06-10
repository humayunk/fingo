class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @top_five = User.order(coins: :desc).limit(5)
    @current_user_in_top_five = @top_five.where(id: current_user.id).any?
    # below line is for testing purposes for forcing rank to be below 5 (so that it will display on leaderboard)
    # @current_user_in_top_five = false
  end
end
