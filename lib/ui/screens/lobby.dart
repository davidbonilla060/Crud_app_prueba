import 'package:crud_app_prueba/ui/screens/Listado.dart';
import 'package:crud_app_prueba/ui/screens/registrar.dart';
import 'package:flutter/material.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  TextEditingController nombre = new TextEditingController();
  TextEditingController documento = new TextEditingController();
  TextEditingController edad = new TextEditingController();
  TextEditingController eps = new TextEditingController();
  TextEditingController telefono = new TextEditingController();
  TextEditingController rol = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: Text('Te damos la bienvenida'),
      ),
      body: Container(
        //padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              //logo,
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.list_outlined, size: 46),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListadoPage()));
                },
                label: Text(
                  "Pacientes",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.add_box, size: 50),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registrar()));
                },
                label: Text(
                  "Registrar",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
