//CAMBIO INSTITUCION
function SetIPVC() {
    var x = document.getElementById("LabelInstitucion");
    x.innerHTML = "IPVC";
    document.getElementById("Institucion").value = "IPVC";

}

function SetUB() {
    var x = document.getElementById("LabelInstitucion");
    x.innerHTML = "UB";
    document.getElementById("Cargo").value = "UB";

}

function SetUAC() {
    var x = document.getElementById("LabelInstitucion");
    x.innerHTML = "UAC";
    document.getElementById("Cargo").value = "UAC";

}
//CAMBIOS CARGO
function SetAuxiliar() {
    var x = document.getElementById("LabelCargo");
    x.innerHTML = "Auxiliar";
    document.getElementById("Cargo").value = "Auxiliar";

}

function SetFuncionario() {
    var x = document.getElementById("LabelCargo");
    x.innerHTML = "Funcionario";
    document.getElementById("Cargo").value = "Funcionario";

}

function SetAdministrador() {
    var x = document.getElementById("LabelCargo");
    x.innerHTML = "Administrador";
    document.getElementById("Cargo").value = "Administrador";
}
//CAMBIOS ESTADO