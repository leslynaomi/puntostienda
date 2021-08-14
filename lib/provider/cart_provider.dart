import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:puntotienda/src/model/CartAttr.dart';
class CartProvider with ChangeNotifier {
  //Cada item corresponde a un elemento en el carrito
  Map<String, CartAttr> _cartItems = {};

  // List<Producto> listproducts = [];

  //La lista de Widgets que corresponden a cada item del carrito
  List<Widget> listWidgetTemp = [];

  //El precio total de la suma y multiplicación de los precios de cada item
  // RxDouble totalCartPrice = 0.0.obs;

  // get getcartItems => this._cartItems;
  Map<String, CartAttr> get getCartItems {
    return {..._cartItems};
  }
  void setCartItems(Map<String, CartAttr> value) => this._cartItems = value;

  get getListWidgetTemp => this.listWidgetTemp;
  void setListWidgetTemp(listWidgetTemp) =>
      this.listWidgetTemp = listWidgetTemp;

  // get getListproducts => this.listproducts;
  // void setListproducts(List<Producto> listproducts) =>
  //     this.listproducts = listproducts;

  // get getTotalCartPrice => this.totalCartPrice;
  // void setTotalCartPrice(RxDouble totalCartPrice) =>
  //     this.totalCartPrice = totalCartPrice;

  // get getCantidad => this.cantidad;
  // void setCantidad(int cantidad) => this.cantidad = cantidad;

  // void changeCart(RxDouble totalCartPrice, List<Widget> listWidgetTemp) {
  //   setTotalCartPrice(totalCartPrice);
  //   setListWidgetTemp(listWidgetTemp);
  // }
//para remover item
void removeItem(String productId){
listWidgetTemp.remove(productId);
notifyListeners();
}

//Vaciar la lista de productos
  void emptyCart() {
    _cartItems.clear();
    listWidgetTemp.clear();
    notifyListeners();
  }

  //Obtener todo el total (suma de subtotales) de todos los productos en el carrito
  double get getTotalAcumulado {
    double total = 0;
    _cartItems.forEach((key, value) {
      total += value.precio * value.cantidad;
    });
    return total;
  }

  //Añadir un producto al carrito con tan solo unos parámetros específicos de entrada
  //Asimismo se encarga de aumentar +1 a la cantidad del producto si ya
  //ha sido añadido al carrito
  void addProducToCart(String nombre, int precio, String imagen) {
    if (_cartItems.containsKey(nombre)) {
      _cartItems.update(
          nombre,
          (exitingCartItem) => CartAttr(
                imagen: exitingCartItem.imagen,
                nombre: exitingCartItem.nombre,
                precio: exitingCartItem.precio,
                cantidad: exitingCartItem.cantidad + 1,
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

  // void aumentarCantidad(String nombre){


  //   notifyListeners();
  // }
  // List<CartItemModel> _convertCartItems(List cartFomDb) {
  //   List<CartItemModel> _result = [];
  //   logger.i(cartFomDb.length);
  //   cartFomDb.forEach((element) {
  //     _result.add(CartItemModel.fromMap(element));
  //   });

  //   return _result;
  // }
}
