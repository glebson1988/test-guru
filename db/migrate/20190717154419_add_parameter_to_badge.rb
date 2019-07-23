class AddParameterToBadge < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :parameter, :string
  end
end
