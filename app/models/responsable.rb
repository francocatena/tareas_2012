class Responsable < ActiveRecord::Base
  attr_accessible :email, :nombre

  validates :nombre, presence: { message: 'no debe estar en blanco' }

  has_many :tareas, dependent: :destroy

  def to_s
    self.nombre
  end
end
