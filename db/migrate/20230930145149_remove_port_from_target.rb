class RemovePortFromTarget < ActiveRecord::Migration[7.0]
  def change
    remove_column :targets, :port
  end
end
