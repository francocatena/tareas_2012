class TareasMailer < ActionMailer::Base
  default from: 'Tareas <tareasrails@gmail.com>'

  def tarea_cercana(tarea)
    @tarea = tarea
    @responsable = tarea.responsable

    mail to: @responsable.email
  end
end
