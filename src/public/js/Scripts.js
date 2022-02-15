$(document).ready(function() {
    $(".Borrar_P")
        .on("click", function() {
            var id_p = $(this).attr("rel");
            var N_P = $(this).attr("Id");
            document.getElementById("Id_prod").textContent = N_P;
            var url = "Inventario/Eliminar/" + id_p;
            $(".Modal-Eliminar-p").attr("href", url);

            $("#myModal").modal("show");
        });

    $('input#rut').focusout(function() {
        let rut = $('input#rut').val();
        let RutValidador = new rutValidador(rut)
        if (RutValidador.esValido) {
            //$('input#rut').addClass('valid-feedback')
            $('input#rut').append("<div class='" + "valid-feedback" + "'>Looks good!</div>")
        } else {
            $('input#rut').append('<div class="invalid-feedback">Please choose a username.</div>')
        }
        if (rut = "") {
            $('input#rut').removeClass('is-invalid');
            $('input#rut').removeClass('valid-feedback');
        }
    });

});