class CreateScrapeTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :scrape_targets do |t|
      t.references :target, null: false, foreign_key: true
      t.references :scrape, null: false, foreign_key: true

      t.timestamps
    end
  end
end
