class NotaCompra {
  //Datos del usuario
  String nameUser;
  String email;
  String telefono;

  //Datos de los productos
  // Map products;

  //Datos de la tarjeta de débito
  String nameBank;
  String numberCard;
  String month;
  String year;
  String numberCVV;

  //Datos de la nota
  double montoTotal;
  DateTime fecha = DateTime.now();

  //Constructor
  NotaCompra({
    //Datos del usuario
    this.nameUser = "",
    this.email = "",
    this.telefono = "",

    //Datos de los productos
    // this.products =
    // {  "nombre": "",
    //   "cantidad": 0,
    //   "precio": 0
    // },

    //Datos de la tarjeta de débito
    this.nameBank = "",
    this.numberCard = "",
    this.month = "",
    this.year = "",
    this.numberCVV = "",
    this.montoTotal = 0,
    // this.fecha = DateTime.now()
  });

  //Algo como un constructor pero que importa los datos de distintos
  //mapas a nuestra clase, agregando los valores necesarios a las
  //variables
  void fromMaps(Map<String, dynamic> user, Map<String, dynamic> cart,
      Map<String, dynamic> card) {
    //Datos del usuario
    nameUser = user["name_user"];
    email = user["email"];
    telefono = user["teléfono"];

    //Datos de los productos
    // nameProduct= cart["nombre"];
    // cantidad= cart["cantidad"];

    //Datos de la tarjeta de débito
    nameBank = card["name_bank"];
    numberCard = card["number_card"];
    month = card["month"];
    year = card["year"];
    numberCVV = card["cvv"];

    //Datos de la nota
    montoTotal = cart["montoTotal"];
    
  }

  //Devuelve un mapa con todos los atributos de la clase
  Map<String, dynamic> toMap() {
    return {
      //Datos del usuario
      "name_user": nameUser,
      "email": email,
      "teléfono": telefono,

      //Datos de los productos
      // "name_product" : nameProduct,
      // "cant_product" : cantidad,

      //Datos de la tarjeta de débito
      "name_bank": nameBank,
      "number_card": numberCard,
      "month": month,
      "year": year,
      "cvv": numberCVV,

      //Datos de la nota
      "monto_total": montoTotal,
      "fecha" : DateTime.now()
    };
  }
}
