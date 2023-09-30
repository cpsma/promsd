class CreateScrapes < ActiveRecord::Migration[7.0]
  def change
    create_table :scrapes do |t|
      t.references :service, null: false, foreign_key: true
      t.references :stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
