
class CartItemModel {
  // String id = "";
  // String nombre = "";
  // String imagen = "";
  int cantidad = 0;
  double precio = 0.0;
  // double costo = 0.0;
  // String productId = "";

  CartItemModel({
    // required this.productId,
    // required this.id,
    // required this.image,
    // required this.name,
    required this.cantidad,
    // required this.cost,
    required this.precio
  });

  CartItemModel.fromMap(Map<String, dynamic> data) {
    // id = data["id"];
    // productId = data["productId"];
    // image = data["imagen"];
    // name = data["nombre"];
    cantidad = data["cantidad"];
    precio = data["precio"].toDouble();
  }

  Map toJson() => {
        // "id": id,
        // "productId": productId,
        // "imagen": image,
        // "nombre": name,
        "cantidad": cantidad,
        "costo": precio * cantidad,
        "precio": precio
      };
}
