class OnboardingController < ApplicationController
  before_action :authenticate_user!

  def step1
    @questions = [
      { id: 1, content: '💰 Financial independence' },
      { id: 2, content: '🏥 Building an emergency fund' },
      { id: 3, content: '📈 Get started with investing' },
      { id: 4, content: '📚 Overall financial literacy' }
    ]
  end

  def save_step1
    if params[:questionnaire].present?
      session[:step1] = params[:questionnaire][:goal]
      redirect_to onboarding_step2_path
    else
      redirect_to onboarding_step1_path, alert: "Please select a goal."
    end
  end

  def step2
    @questions = [
      { id: 1, content: '📊 Understanding stock market basics' },
      { id: 2, content: '💡 Developing investment strategies' },
      { id: 3, content: '🛡️ Risk management' },
      { id: 4, content: '🔍 Analyzing stocks' }
    ]
  end

  def save_step2
    if params[:questionnaire].present?
      session[:step2] = params[:questionnaire][:focus]
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
      current_user.update(onboarding_data: { step1: session[:step1], step2: session[:step2], step3: params[:questionnaire][:comfort_level] })
      redirect_to courses_path, notice: "Thank you for completing the questionnaire!"
    else
      redirect_to onboarding_step3_path, alert: "Please select a comfort level."
    end
  end
end
