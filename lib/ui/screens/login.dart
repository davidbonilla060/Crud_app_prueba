import 'package:crud_app_prueba/db/database_crud.dart';
import 'package:crud_app_prueba/models/usuarios_model.dart';
import 'package:crud_app_prueba/ui/screens/lobby.dart';
import 'package:crud_app_prueba/ui/screens/reg_us.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nombre = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  Future _login() async {
    var nueva = await BaseDatosLocal.login(nombre.text, pass.text);
    print(nombre);
    if (nueva.isNotEmpty) {
      print("holas");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Lobby()));
    } else {
      print("F");
    }
    return nueva;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1)).then((value) {
      BaseDatosLocal.CrearUsuarios(
          CrearUsuario(nombre: "admin", pass: "admin"), "admin", "admin");
    });
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
        title: Text("Acceso"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: <Widget>[
              logo,
              SizedBox(height: 20.0),
              TextFormField(
                controller: nombre,
                decoration: InputDecoration(
                  hintText: 'Ingrese su nombre',
                  border: OutlineInputBorder(),
                  labelText: 'Nombre',
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
                label: Text("Acceder"),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
              ),
              SizedBox(height: 15.0),
              TextButton(
                onPressed: () {
                  print("object");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegUserPage()));
                },
                child: Text("Registrarse"),
              ),

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
