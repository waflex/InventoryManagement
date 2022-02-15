class rutValidador {
    constructor(rut) {
        this.rut = rut;
        //Se obtiene ultimo Caracter
        this.dv = this.rut.substring(this.rut.length - 1);
        this.rut = this.rut.substring(0, this.rut.length - 1).replace(/\D/g, '');
        this.esValido = this.validarRut();

    }

    validarRut() {
        let numsSep = this.rut.split('').reverse();
        let sumas = 0;
        let multi = 2;
        for (let numeros of numsSep) {
            sumas += parseInt(numeros) * multi;
            multi++;
            if (multi == 8) {
                multi = 2;
            }

        }

        let dv = 11 - (sumas % 11);
        if (dv == 11)
            dv = '0';
        if (dv == 10)
            dv = 'k';
        return dv == this.dv.toLowerCase();
    }

    formateado() {
        if (!this.esValido) return '';
        return (this.rut.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')) + '-' + this.dv;

    }
}