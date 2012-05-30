module TareasHelper
  def show_tarea_responsable_select(form)
    form.select :responsable_id, Responsable.all.map { |r| [r.to_s, r.id] },
      include_blank: true
  end
end
