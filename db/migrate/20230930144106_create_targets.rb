class CreateTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :targets do |t|
      t.references :job, null: false, foreign_key: true
      t.string :ip_address
      t.string :port

      t.timestamps
    end
  end
end
