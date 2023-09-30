class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.string :ip_address

      t.timestamps
    end
  end
end
