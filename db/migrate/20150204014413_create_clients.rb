class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nombre
      t.string :email
      t.string :doc_type
      t.string :doc

      t.timestamps null: false
    end
  end
end
