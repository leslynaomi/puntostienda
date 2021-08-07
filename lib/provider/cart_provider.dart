import 'package:flutter/widgets.dart';
import 'package:puntotienda/methods/database/conexion_firestore.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartItems = {};




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
