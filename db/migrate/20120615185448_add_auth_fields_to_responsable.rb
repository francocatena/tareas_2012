class AddAuthFieldsToResponsable < ActiveRecord::Migration
  def change
    add_column :responsables, :clave_cifrada, :string
    add_column :responsables, :salt, :string

    add_index :responsables, :email
  end
end
