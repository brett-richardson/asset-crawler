class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :domain
      t.string :path
      t.string :state
      t.string :title
      t.timestamps
    end
  end
end
