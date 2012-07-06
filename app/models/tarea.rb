class Tarea < ActiveRecord::Base
  attr_accessible :nombre, :detalles, :fecha, :completa, :responsable_id

  validates :nombre, presence: true

  belongs_to :responsable

  def completa!
    self.update_attributes! completa: true
  end
end
