class Tarea < ActiveRecord::Base
  attr_accessor :auto_responsable
  attr_accessible :nombre, :detalles, :fecha, :completa, :responsable_id,
    :auto_responsable

  validates :nombre, presence: true

  belongs_to :responsable

  def to_s
    self.nombre
  end

  def completa!
    self.update_attributes! completa: true
  end

  def self.recordar_vencimientos
    tareas = Tarea.where(
      [
        'fecha BETWEEN :hoy AND :futuro',
        'responsable_id IS NOT NULL',
        'completa = :false'
      ].join(' AND '),
      hoy: Date.today,
      futuro: 3.days.from_now.to_date,
      false: false
    )

    tareas.each do |tarea|
      TareasMailer.tarea_cercana(tarea).deliver
    end
  end
end
