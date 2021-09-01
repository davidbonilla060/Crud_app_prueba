class CrearUsuario {
  var id;
  String nombre;
  String pass;

  CrearUsuario({
    required this.nombre,
    required this.pass,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "nombre": nombre,
      "pass": pass,
    };
  }
}
