class CreateAssetLinks < ActiveRecord::Migration
  def change
    create_table :asset_links do |t|
      t.references :domain
      t.references :source
      t.references :asset
    end
  end
end
