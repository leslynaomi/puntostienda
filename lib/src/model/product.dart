class Producto {
  String nombre;
  String descripcion;
  String precio;
  String stock;
  String categoria;
  String imagen;

  get getNombre => this.nombre;
  void setNombre(String nombre) => this.nombre = nombre;

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

  Producto(
      {this.nombre = "",
      this.descripcion = "",
      this.precio = "",
      this.stock = "",
      this.categoria = "",
      this.imagen = ""});

  Producto.fromJson(Map<String, dynamic> json)
      : this(
          nombre: json['nombre']! as String,
          descripcion: json['descripcion']! as String,
          precio: json['precio']! as String,
          stock: json['stock']! as String,
          categoria: json['categoria']! as String,
          imagen: json['imagen']! as String,
        );

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'stock': stock,
      'categoria': categoria,
      'imagen': imagen
    };
  }

  void fromMap(Map<String, dynamic> map) {
    nombre = map['nombre'];
    descripcion = map['descripcion'];
    precio = map['precio'];
    stock = map['stock'];
    categoria = map['categoria'];
    imagen = map['imagen'];
  }
}
