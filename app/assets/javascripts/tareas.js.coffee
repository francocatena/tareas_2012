jQuery ($)->
  $(document).on 'ajax:success', 'a[data-completar-tarea]', (xhr, data)->
    $(this).parents('tr:first').replaceWith(data)
