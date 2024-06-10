class LeaderboardController < ApplicationController
  def index
    @users = User.order(coins: :desc).limit(5)
  end
end
