class AddPassedTestsRef < ActiveRecord::Migration[5.2]
  def change
    add_reference(:passed_tests, :test, foreign_key: true)
    add_reference(:passed_tests, :user, foreign_key: true)
  end
end
