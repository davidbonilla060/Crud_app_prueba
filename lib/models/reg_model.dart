class RegistroPData {
  var id;
  String nombre;
  String edad;
  String eps;
  String documento;
  String telefono;
  String genero;
  String rol;

  RegistroPData({
    required this.nombre,
    required this.documento,
    required this.genero,
    required this.rol,
    required this.telefono,
    required this.eps,
    required this.edad,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, //
      "nombre": nombre, //
      "documento": documento,
      "edad": edad,
      "eps": eps,
      "telefono": telefono,
      "genero": genero,
      "rol": rol,
    };
  }

  Map<String, dynamic> toMap1() {
    return {
      "nombre": nombre, //
      "documento": documento,
      "edad": edad,
      "eps": eps,
      "telefono": telefono,
      "genero": genero,
      "rol": rol,
    };
  }
}
