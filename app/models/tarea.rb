class Tarea < ActiveRecord::Base
  attr_accessible :nombre, :detalles, :fecha, :responsable_id

  validates :nombre, presence: { message: 'no debe estar en blanco' }

  belongs_to :responsable
end
