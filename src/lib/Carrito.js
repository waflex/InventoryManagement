module.exports = function Carrito(OldData) {
    this.items = OldData.items || {}; // items = Objeto a agregar, OldData = Objetos existentes en el carro
    this.CantTotal = OldData.CantTotal || 0; //Cant = ya se sabe, es la cantidad que viene duh
    //this.PrecioTotal = OldData.PrecioTotal;

    this.agregar = function(items, Id_Producto, cant) { //Stored Items = Objetos en el carrito
        var storedItem = this.items[Id_Producto];
        if (!storedItem) {
            storedItem = this.items[Id_Producto] = { items: items, qty: 0 }; //price: 0  en carritos de venta agregar price
        }
        storedItem.qty += cant; //se entiende cant = cantidad etc etc

        //storedItem.price= storedItem.item.price*storedItem.qty;  Aqui Acumulas el valor*cant individual en productos

        this.CantTotal++; //Acumulacion de diferentes productos, osea 3 productos distintos etc
        //this.PrecioTotal += storedItem.item.price; Aca acumulas el total mas el valor individual en productos, (precio total = precio total + (precio*cantidad))

    };
    this.recudir1 = function(id) {
        this.items[id].qty--;
        this.CantTotal--;
        if (this.items[id].qty <= 0) {
            delete this.items[id];
        }
        //storedItem.price -= this.items[id].price                  ||Esto para reducir precio
        //this.PrecioTotal -= this.items[id].price                  ||Esto para reducir el precio total
        /*this.CantTotal--; Esto para carritos de compras, para control total de productos,
        pero arriba esta para control total de distintos articulos*/


    };
    this.eliminarProd = function(id) {
        this.CantTotal -= this.items[id].qty;
        delete this.items[id];


        //storedItem.price -= this.items[id].price                  ||Esto para reducir precio
        //this.PrecioTotal -= this.items[id].price                  ||Esto para reducir el precio total
        /*this.CantTotal--; Esto para carritos de compras, para control total de productos,
        pero arriba esta para control total de distintos articulos*/
    };



    this.generarArray = function() {
        var arr = [];
        for (var id in this.items) {
            arr.push(this.items[id]);
        }
        return arr;
    };

    this.Empty = function() {
        if (this.items.length == 0) {
            console.log("es 0");
        } else {
            console.log(this.items.length);
        }
    };
};