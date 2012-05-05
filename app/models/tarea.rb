class Tarea < ActiveRecord::Base
  attr_accessible :nombre, :detalles

  validates :nombre, presence: { message: 'no debe estar en blanco' }
end
