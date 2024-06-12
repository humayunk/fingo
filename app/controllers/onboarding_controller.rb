class OnboardingController < ApplicationController
  before_action :authenticate_user!

  def step1
    @questions = [
      { id: 1, content: 'Financial independence', icon: 'mdi:currency-usd' },
      { id: 2, content: 'Building an emergency fund', icon: 'mdi:piggy-bank' },
      { id: 3, content: 'Get started with investing', icon: 'mdi:chart-line' },
      { id: 4, content: 'Overall financial literacy', icon: 'mdi:book-open-page-variant' }
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
      { id: 1, content: 'Understanding stock market basics', icon: 'mdi:chart-bar' },
      { id: 2, content: 'Developing investment strategies', icon: 'mdi:lightbulb-on-outline' },
      { id: 3, content: 'Risk management', icon: 'mdi:shield-lock-outline' },
      { id: 4, content: 'Analyzing stocks', icon: 'mdi:magnify' }
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
      { id: 1, content: 'Math what?', icon: 'mdi:help-circle-outline' },
      { id: 2, content: 'I know my way around a calculator', icon: 'mdi:calculator-variant-outline' },
      { id: 3, content: 'Math is my bestie', icon: 'mdi:heart' },
      { id: 4, content: 'I inhale equations for breakfast', icon: 'mdi:brain' }
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
