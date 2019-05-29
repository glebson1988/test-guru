class ChangeTablePassedTests < ActiveRecord::Migration[5.2]
  def change
    remove_column(:passed_tests, :user_id)
    remove_column(:passed_tests, :test_id)
  end
end
