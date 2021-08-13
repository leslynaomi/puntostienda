import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:puntotienda/consts/app_constants.dart';
import 'package:puntotienda/methods/cart_item.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
import 'package:puntotienda/src/model/product.dart';

class CartProvider with ChangeNotifier {
  //Cada item corresponde a un elemento en el carrito
  Map<String, CartAttr> _cartItems = {};

  List<Producto> listproducts = [];

  //La lista de Widgets que corresponden a cada item del carrito
  List<Widget> listWidgetTemp = [];

  //El precio total de la suma y multiplicación de los precios de cada item
  RxDouble totalCartPrice = 0.0.obs;

  get getcartItems => this._cartItems;
  void setcartItems(Map<String, CartAttr> value) => this._cartItems = value;

  get getListWidgetTemp => this.listWidgetTemp;
  void setListWidgetTemp(listWidgetTemp) =>
      this.listWidgetTemp = listWidgetTemp;

  get getListproducts => this.listproducts;
  void setListproducts(List<Producto> listproducts) =>
      this.listproducts = listproducts;

  get getTotalCartPrice => this.totalCartPrice;
  void setTotalCartPrice(RxDouble totalCartPrice) =>
      this.totalCartPrice = totalCartPrice;

  // get getCantidad => this.cantidad;
  // void setCantidad(int cantidad) => this.cantidad = cantidad;

  void changeCart(RxDouble totalCartPrice, List<Widget> listWidgetTemp) {
    setTotalCartPrice(totalCartPrice);
    setListWidgetTemp(listWidgetTemp);
  }

//Vaciar la lista de productos
  void emptyCart() {
    listWidgetTemp.clear();
    notifyListeners();
  }

  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }

  double get totalAmount {
    double total = 0;
    _cartItems.forEach((key, value) {
      total += value.precio * value.cantidad;
    });
    return total;
  }

  void addProducToCart(String nombre, int precio, String imagen, int stock) {
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

  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });

    return _result;
  }
}
