$(document).on("keyup", ".rut", () => {
    let rut = $(".rut").val();
    let RutValidador = new rutValidador(rut);
    if (RutValidador.esValido) {
        $(".rut").attr("style", "border-color: #28a745;");
        if (RutValidador.formateado().length > 8) {
            $(".rut").val(RutValidador.formateado());
        }
        $(".btn-habilitado").prop("disabled", false);
        $(".temporal").remove();
    } else {
        $(".rut").attr("style", "border-color:#ca2e1a");
        if (RutValidador.formateado().length > 8) {
            $(".rut").val(RutValidador.formateado());
        }
        $(".btn-habilitado").prop("disabled", true);
        if ($(".temporal").length) {} else {
            $(
                "<label for=rut class=temporal>Ingrese un RUT valido</label>"
            ).insertAfter(".rut");
        }
    }
    if (rut == "") {
        $(".rut").attr("style", "");
    }
});