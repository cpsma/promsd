class AddNameToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :name, :string
  end
end
