Merkredo.ModalBodyView = Merkredo.View.extend

  flash: (message, className) ->
    $alert = $('#modal-alert').hide().removeClass('success alert')
    $alert.addClass('alert-box ' + className).html(message)
    $alert.fadeIn();
