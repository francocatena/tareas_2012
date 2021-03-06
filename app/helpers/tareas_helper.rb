module TareasHelper
  def show_tarea_responsable_select(form)
    form.input(
      :responsable_id,
      collection: Responsable.all.map { |r| [r.to_s, r.id] },
      prompt: true
    )
  end
end
