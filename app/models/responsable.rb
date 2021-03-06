# encoding: UTF-8
require 'digest/sha2'

class Responsable < ActiveRecord::Base
  # Ganchos
  before_save :asignar_clave_cifrada

  # Atributos no persistentes
  attr_accessor :clave

  attr_accessible :nombre, :email, :clave

  validates :nombre, presence: true

  has_many :tareas, dependent: :destroy

  def to_s
    self.nombre
  end

  def as_json(options = {})
    super({ only: [:id, :nombre] }.merge(options))
  end

  def generar_salt
    self.salt = Digest::SHA512.hexdigest(rand.to_s)
  end

  def asignar_clave_cifrada
    self.generar_salt if self.salt.blank?

    self.clave_cifrada = cifrar_clave(self.clave) if self.clave.present?
  end

  def cifrar_clave(clave)
    Digest::SHA512.hexdigest(self.salt.to_s + clave.to_s)
  end

  def clave_valida?(clave)
    self.clave_cifrada == cifrar_clave(clave)
  end

  def self.con_nombre(nombre)
    where("LOWER(#{table_name}.nombre) LIKE ?", "#{nombre}%".downcase)
  end
end
