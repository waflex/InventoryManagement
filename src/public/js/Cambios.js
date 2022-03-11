//CAMBIO INSTITUCION
function SetIPVC() {
    document.getElementById("LabelInstitucion").innerHTML = "IPVC";
    document.getElementById("Institucion").value = "IPVC";
    $(".cancel").attr("hidden", false);

}

function SetUB() {
    document.getElementById("LabelInstitucion").innerHTML = "UB";
    document.getElementById("Cargo").value = "UB";
    $(".cancel").attr("hidden", false);


}

function SetUAC() {
    document.getElementById("LabelInstitucion").innerHTML = "UAC";
    document.getElementById("Cargo").value = "UAC";
    $(".cancel").attr("hidden", false);


}
//CAMBIOS CARGO
function SetAuxiliar() {
    document.getElementById("LabelCargo").innerHTML = "Auxiliar";
    document.getElementById("Cargo").value = "Auxiliar";
    $(".cancel").attr("hidden", false);


}

function SetFuncionario() {
    document.getElementById("LabelCargo").innerHTML = "Funcionario";
    document.getElementById("Cargo").value = "Funcionario";
    $(".cancel").attr("hidden", false);


}

function SetAdministrador() {
    document.getElementById("LabelCargo").innerHTML = "Administrador";
    document.getElementById("Cargo").value = "Administrador";
    $(".cancel").attr("hidden", false);

}
//CAMBIOS ESTADO


//Cancelar cambios individuales