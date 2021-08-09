import 'package:flutter/material.dart';

class ProductoProvider extends ChangeNotifier {
  String nombre = "";
  String descripcion = "";
  String precio = "";
  String stock = "";
  String categoria = "";
  String imagen = "https://cdn.discordapp.com/attachments/830172607357386764/873380701402169374/loading.png";

  get getNombre => this.nombre;
  void setNombre(nombre) => this.nombre = nombre;

  get getDescripcion => this.descripcion;
  void setDescripcion(descripcion) => this.descripcion = descripcion;

  get getPrecio => this.precio;
  void setPrecio(precio) => this.precio = precio;

  get getStock => this.stock;
  void setStock(stock) => this.stock = stock;

  get getCategoria => this.categoria;
  void setCategoria(categoria) => this.categoria = categoria;

  get getImagen => this.imagen;
  void setImagen(imagen) => this.imagen = imagen;

  void changeUser(
    String nombre,
    String descripcion,
    String precio,
    String stock,
    String categoria,
    String imagen,
  ) {
    setNombre(nombre);
    setDescripcion(descripcion);
    setPrecio(precio);
    setStock(stock);
    setCategoria(categoria);
    setImagen(imagen);

    //Notificamos a los oyentes
    notifyListeners();
  }
}
