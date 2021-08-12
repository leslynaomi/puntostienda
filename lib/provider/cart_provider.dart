import 'package:flutter/widgets.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};
  List<Widget> listWidgetTemp = [];

  // int cantidad = 0;

  get getListWidgetTemp => this.listWidgetTemp;
  void setListWidgetTemp(listWidgetTemp) =>
      this.listWidgetTemp = listWidgetTemp;

  // get getCantidad => this.cantidad;
  // void setCantidad(int cantidad) => this.cantidad = cantidad;

  void changeCart(/*int cantidad,*/ List<Widget> listWidgetTemp) {
    // setCantidad(cantidad);
    setListWidgetTemp(listWidgetTemp);
  }

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  int get totalAmount {
    var total = 0;
    _cartItems.forEach((key, value) {
      total += value.precio * value.cantidad;
    });
    return total;
  }

  void addProducToCart(String nombre, int precio, String imagen) {
    if (_cartItems.containsKey(nombre)) {
      _cartItems.update(
          nombre,
          (exitingCartItem) => CartAttr(
                nombre: exitingCartItem.nombre,
                precio: exitingCartItem.precio,
                cantidad: exitingCartItem.cantidad + 1,
                imagen: exitingCartItem.imagen,
              ));
    } else {
      _cartItems.putIfAbsent(
          nombre,
          () => CartAttr(
                nombre: nombre,
                precio: precio,
                cantidad: 1,
                imagen: imagen,
              ));
    }
    notifyListeners();
  }
}
