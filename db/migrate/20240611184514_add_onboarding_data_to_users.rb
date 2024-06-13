class AddOnboardingDataToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :onboarding_data, :jsonb
  end
end
