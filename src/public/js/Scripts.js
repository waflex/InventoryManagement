$(document).ready(function() {
    $(".Borrar_P").click(function() {
        var id_p = $(this).attr("rel");
        var N_P = $(this).attr("Id");
        document.getElementById("Id_prod").textContent = N_P;
        var url = "Inventario/Eliminar/" + id_p;
        $(".Modal-Eliminar-p").attr("href", url);

        $("#myModal").modal("show");
    });

    $("#institucion").click(function() {
        let inst = $("#institucion").prop('selectedIndex');
        let cargo = $("#Cargo").prop('selectedIndex');
        if (inst > 0 && cargo > 0) {
            $('.btn-habilitado').prop('disabled', false);
        } else {
            $('.btn-habilitado').prop('disabled', true);
        }
    });
    $("#Cargo").click(function() {
        let inst = $("#institucion").prop('selectedIndex');
        let cargo = $("#Cargo").prop('selectedIndex');
        if (inst > 0 && cargo > 0) {
            $('.btn-habilitado').prop('disabled', false);
        } else {
            $('.btn-habilitado').prop('disabled', true);
        }
    });
});


$(document).on("keyup", ".rut", () => {
    let rut = $(".rut").val();
    let inst = $("#institucion").prop('selectedIndex');
    let cargo = $("#Cargo").prop('selectedIndex');
    let RutValidador = new rutValidador(rut);
    if (RutValidador.esValido) {
        $(".rut").attr("style", "border-color: #28a745;");
        if (RutValidador.formateado().length > 8) { $(".rut").val(RutValidador.formateado()); }
        if (inst > 0 && cargo > 0) {
            $('.btn-habilitado').prop('disabled', false);
        } else {
            $('.btn-habilitado').prop('disabled', true);
        }
    } else {
        $(".rut").attr("style", "border-color:#ca2e1a");
        if (RutValidador.formateado().length > 8) { $(".rut").val(RutValidador.formateado()); }
        $('.btn-habilitado').prop('disabled', true);
    }
    if (rut == "") {
        $(".rut").attr("style", "");
    }
});