import 'package:flutter/material.dart';

class Tarjeta2 extends StatefulWidget {
  final VoidCallback onPressed;
  String nombre;
  String documento;
  String genero;
  String rol;
  String telefono;
  String eps;
  int edad;

  Tarjeta2({
    required this.onPressed,
    required this.nombre,
    required this.documento,
    required this.genero,
    required this.telefono,
    required this.rol,
    required this.eps,
    required this.edad,
  });
  @override
  _Tarjeta2State createState() => _Tarjeta2State();
}

class _Tarjeta2State extends State<Tarjeta2> {
  int color = 1;
  int rojo = 0xFFffbb93;
  int verde = 0xFFb2fab4;
  @override
  Widget build(BuildContext context) {
    if (widget.edad >= 50) {
      setState(() {
        color = rojo;
      });
    } else {
      setState(() {
        color = verde;
      });
    }

    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        //width: 100,
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Color(color),
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              blurRadius: 4,
            )
          ],
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Nombre: ${widget.nombre} \n Documento: \t ${widget.documento}",
                textAlign: TextAlign.right,
              ),
              //isThreeLine: true,
              subtitle: Text(
                'Edad:  ${widget.edad}\n EPS: \t ${widget.eps}\n Género:  ${widget.genero}\n Teléfono: \t ${widget.telefono} \n Rol: \t ${widget.rol} ',
                textAlign: TextAlign.right,
              ),
              leading: Icon(
                Icons.label_important_sharp,
                color: Colors.black45,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
