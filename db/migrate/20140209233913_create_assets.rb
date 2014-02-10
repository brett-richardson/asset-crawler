class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :type
      t.string :state
      t.string :path
      t.references :domain
    end
  end
end
