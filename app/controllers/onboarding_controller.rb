class OnboardingController < ApplicationController
  skip_before_action :authenticate_user!

  def step1
    @questions = [
      { id: 1, content: '💰 Get that bag' },
      { id: 2, content: '☔️ Be rainy day ready' },
      { id: 3, content: '📈 Dominate r/wallstreetbets subreddit' },
      { id: 4, content: '📚 Drop fancy acronyms like ETFs' }
    ]
  end

  def save_step1
    if params[:questionnaire].present?
      redirect_to onboarding_step2_path
    else
      redirect_to onboarding_step1_path, alert: "Please select a goal."
    end
  end

  def step2
    @questions = [
      { id: 1, content: '📊 Mastering the stonk market' },
      { id: 2, content: '🪺 Diversifying my non-existent nest egg' },
      { id: 3, content: '🥑 Eat less avocado toast' },
      { id: 4, content: '📸 Look rich on a budget on Insta' }
    ]
  end

  def save_step2
    if params[:questionnaire].present?
      redirect_to onboarding_step3_path
    else
      redirect_to onboarding_step2_path, alert: "Please select a focus."
    end
  end

  def step3
    @questions = [
      { id: 1, content: '❓ Math what?' },
      { id: 2, content: '🧮 I know my way around a calculator' },
      { id: 3, content: '❤️ Math is my bestie' },
      { id: 4, content: '🧠 I inhale equations for breakfast' }
    ]
  end

  def save_step3
    if params[:questionnaire].present?
      redirect_to new_user_registration_path # Redirect to sign-up page
    else
      redirect_to onboarding_step3_path, alert: "Please select a comfort level."
    end
  end
end
