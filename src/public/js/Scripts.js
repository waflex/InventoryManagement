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

    /*var rut;

    $('#rut').focusout(function() {
        var div1, div2, div3, div4;
        rut = $(this).val();

        if (rut.length == 9) {
            div1 = rut.slice(0, 2);
            div2 = rut.slice(2, 5);
            div3 = rut.slice(5, 8);
            div4 = rut.slice(8, 9);

            rut = $(this).val(div1 + "." + div2 + "." + div3 + "-" + div4);
        }

        if (rut.length == 8) {
            div1 = rut.slice(0, 1);
            div2 = rut.slice(1, 4);
            div3 = rut.slice(4, 7);
            div4 = rut.slice(7, 8);

            rut = $(this).val(div1 + "." + div2 + "." + div3 + "-" + div4);
        }
    });*/

    /*$("input#Usuario")
        .rut({ formatOn: 'keyup', validateOn: 'keyup' })

    .on('rutInvalido', function() {
            $(this).parents(".form-group").addClass("error");
        })
        .on('rutValido', function() {
            $(this).parents(".form-group").removeClass("is-valid");
        });*/
    try {
        $("input#Usuario")
            .rut({ validateOn: 'keyup change' })
            .on('rutInvalido', function() {
                // $(this).parents(".control-group").addClass("error");
                //alert("El rut " + $(this).val() + " es inválido");
            })
            .on('rutValido', function() {
                //$(this).parents(".control-group").removeClass("is-valid");
                alert("El rut " + rut + "-" + dv + " es correcto");
            });
    } catch (error) {
        console.log(error);
    }

});