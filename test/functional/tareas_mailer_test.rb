require 'test_helper'

class TareasMailerTest < ActionMailer::TestCase
  test 'tarea cercana' do
    tarea = tareas(:ir_al_curso)
    mail = TareasMailer.tarea_cercana(tarea)
    assert_equal I18n.t('tareas_mailer.tarea_cercana.subject'), mail.subject
    assert_equal [tarea.responsable.email], mail.to
    assert_equal ['tareasrails@gmail.com'], mail.from
    assert_match "Hola #{tarea.responsable.nombre}", mail.body.encoded

    assert_difference 'ActionMailer::Base.deliveries.size' do
      mail.deliver
    end
  end
end
