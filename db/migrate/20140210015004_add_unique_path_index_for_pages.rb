class AddUniquePathIndexForPages < ActiveRecord::Migration
  def change
    add_index :pages, [ :domain_id, :path ], unique: true
  end
end
