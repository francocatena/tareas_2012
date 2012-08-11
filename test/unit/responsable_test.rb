require 'test_helper'

class ResponsableTest < ActiveSupport::TestCase
  setup do
    @responsable = responsables(:franco)
  end

  test 'nombre no debe estar en blanco' do
    @responsable.nombre = ''
    
    assert @responsable.invalid?
    assert_equal 1, @responsable.errors.size
    assert_equal I18n.t('errors.messages.blank'),
      @responsable.errors[:nombre].first
  end

  test 'el salt y la clave cifrada se asignan cuando creamos un responsable' do
    assert_difference 'Responsable.count' do
      @responsable = Responsable.create(
        nombre: 'Franco', email: 'f@c.com', clave: '123'
      )
    end

    assert @responsable.salt.present?
    assert @responsable.clave_cifrada.present?
    assert @responsable.clave_valida?('123')
  end

  test 'busqueda por nombre parcial' do
    responsables = Responsable.con_nombre('fran')

    assert_equal 1, responsables.size
    assert responsables.all? { |r| r.nombre =~ /\Afran/i }
  end
end
