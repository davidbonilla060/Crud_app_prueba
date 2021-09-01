import 'dart:convert';
import 'package:crud_app_prueba/db/database_crud.dart';
import 'package:crud_app_prueba/ui/screens/lobby.dart';
import 'package:crud_app_prueba/ui/screens/modificar.dart';
import 'package:crud_app_prueba/ui/widgets/tarjeta.dart';
import 'package:flutter/material.dart';

class ListadoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListadoPage();
  }
  /* @override
  _ListadoPageState createState() => _ListadoPageState(); */
}

class _ListadoPage extends State<ListadoPage> {
  List data = [];
  List pac = [];

  Future Lista() async {
    var nueva = await BaseDatosLocal.Listado();
    setState(() {
      data = nueva;
    });
    return data;
  }

  Future Consulta(p, List listpac) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text("Desea eliminar al paciente"),
                Padding(padding: EdgeInsets.all(2)),
                ElevatedButton(
                    onPressed: () {
                      print("1");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ModifiPage(
                                  id: int.parse(listpac[p]['id'].toString()),
                                  nombre: listpac[p]['nombre'],
                                  documento: listpac[p]['documento'],
                                  eps: listpac[p]['eps'],
                                  genero: listpac[p]['genero'],
                                  rol: listpac[p]['rol'],
                                  telefono: listpac[p]['telefono'],
                                  edad: int.parse(
                                      listpac[p]['edad'].toString()))));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: Text("Modificar")),
                Text("ó"),
                ElevatedButton(
                    onPressed: () {
                      print("2");
//                      Eliminacion(int.parse(listpac[p]['id'].toString()));
                      BaseDatosLocal.BorrarDato(
                          int.parse(listpac[p]['id'].toString()));
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.teal)),
                    child: Text("Eliminar"))
              ],
            ),
            title: RichText(
              text: TextSpan(
                //style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Aviso:\n",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Eliminar o Modificar datos del paciente.",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.6), fontSize: 16),
                  ),
                ],
              ),
            ),
            /* Text(
              'AVISO: Eliminar o Modificar paciente',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ), */
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cerrar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text('Listado'),
          backgroundColor: Colors.teal,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Lobby()));
            },
          ),
          /* actions: [
            IconButton(
                onPressed: () {
                  //DataBaseREC.BorrarDatos();
                },
                icon: Icon(Icons.delete_forever))
          ], */
        ),
        body: FutureBuilder(
          future: Lista(),
          builder: (context, snapshotP) {
            if (!snapshotP.hasData || snapshotP.hasError) {
              return CircularProgressIndicator();
            } else {
              pac = json.decode(json.encode(snapshotP.data));
              return ListView.builder(
                itemCount: pac == null ? 0 : pac.length,
                itemBuilder: (context, p) {
                  return Tarjeta2(
                      onPressed: () {
                        Consulta(p, pac);
                      },
                      nombre: pac[p]['nombre'],
                      documento: pac[p]['documento'],
                      genero: pac[p]['genero'],
                      telefono: pac[p]['telefono'],
                      rol: pac[p]['rol'],
                      eps: pac[p]['eps'],
                      edad: int.parse(pac[p]['edad'].toString()));
                },
              );
            }
          },
        ));
  }
}
