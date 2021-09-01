import 'package:crud_app_prueba/db/database_crud.dart';
import 'package:crud_app_prueba/models/usuarios_model.dart';
import 'package:flutter/material.dart';

class RegUserPage extends StatefulWidget {
  @override
  _RegUserPage createState() => _RegUserPage();
}

class _RegUserPage extends State<RegUserPage> {
  TextEditingController nombre = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future _login() async {
    BaseDatosLocal.CrearUsuarios(
        CrearUsuario(nombre: nombre.text, pass: pass.text),
        nombre.text,
        pass.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Padding(
      padding: EdgeInsets.all(20),
      child: Hero(
          tag: 'hero',
          child: CircleAvatar(
            radius: 56.0,
            child: Image.asset('assets/logo.png'),
            backgroundColor: Colors.white10,
          )),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: <Widget>[
              //logo,
              SizedBox(height: 20.0),
              TextFormField(
                controller: nombre,
                decoration: InputDecoration(
                  hintText: 'Ingrese su usuario',
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese su contraseña',
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 15.0),
              ElevatedButton.icon(
                icon: Icon(Icons.account_circle_outlined, size: 30),
                onPressed: () {
                  _login();
                },
                label: Text("Registrar"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
              ),
              SizedBox(height: 15.0),
              /*           TextButton(
                onPressed: () {
                  print("object");
                },
                child: Text("Registrarse"),
              ) ,*/

/*               Text(
                msg,
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ) */
            ],
          ),
        ),
      ),
    );
  }
}
