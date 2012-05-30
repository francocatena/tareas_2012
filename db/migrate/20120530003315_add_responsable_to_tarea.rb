class AddResponsableToTarea < ActiveRecord::Migration
  def change
    change_table :tareas do |t|
      t.references :responsable
    end

    add_foreign_key :responsables, :tareas
  end
end
