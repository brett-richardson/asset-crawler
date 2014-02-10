class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.references :domain
      t.references :source
      t.references :target

      t.string :path
      t.string :text
    end
  end
end
