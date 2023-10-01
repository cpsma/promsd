class AddIndexToScrapeTargets < ActiveRecord::Migration[7.0]
  def change
    add_index :scrape_targets, [:target_id, :scrape_id], unique: true
  end
end
