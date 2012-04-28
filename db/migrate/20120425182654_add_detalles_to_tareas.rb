class AddDetallesToTareas < ActiveRecord::Migration
  def change
    add_column :tareas, :detalles, :text
  end
end
