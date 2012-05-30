class CreateResponsables < ActiveRecord::Migration
  def change
    create_table :responsables do |t|
      t.string :nombre
      t.string :email

      t.timestamps
    end
  end
end
