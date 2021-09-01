import 'package:crud_app_prueba/db/database_crud.dart';
import 'package:crud_app_prueba/models/reg_model.dart';
import 'package:crud_app_prueba/ui/screens/Listado.dart';
import 'package:crud_app_prueba/ui/screens/lobby.dart';
import 'package:flutter/material.dart';

class Registrar extends StatefulWidget {
  @override
  _RegistrarState createState() => _RegistrarState();
}

class _RegistrarState extends State<Registrar> {
  TextEditingController nombre = new TextEditingController();
  TextEditingController documento = new TextEditingController();
  TextEditingController edad = new TextEditingController();
  TextEditingController telefono = new TextEditingController();
  TextEditingController genero = new TextEditingController();

  var valueChoose1;
  var valueChoose2;

  List epss = ['Nueva EPS', 'Sanitas', 'AsmetSalud', 'SaludTotal'];
  List rol = ['Médico', 'Paciente'];
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  Future Registrar() async {
    if (nombre.text.isEmpty ||
        edad.text.isEmpty ||
        documento.text.isEmpty ||
        genero.text.isEmpty ||
        telefono.text.isEmpty ||
        valueChoose2 == null ||
        valueChoose1 == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error")));
    } else {
      BaseDatosLocal.guardarRegistro(RegistroPData(
          nombre: nombre.text,
          documento: documento.text,
          genero: genero.text,
          rol: valueChoose2.toString(),
          telefono: telefono.text,
          eps: valueChoose1.toString(),
          edad: edad.text));

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListadoPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Lobby()));
            },
          ),
          title: Text('Registrar Datos'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                //SizedBox(height: 50.0),
                TextFormField(
                  controller: nombre,
                  //initialValue: 'Ingrese su nombre',
                  decoration: InputDecoration(
                    hintText: 'Ingrese su nombre completo',
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
                SizedBox(height: 5.0),
/*               Text(
                "Contraseña",
                style: TextStyle(fontSize: 18.0),
              ), */
                TextFormField(
                  controller: documento,
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su número de cédula',
                    border: OutlineInputBorder(),
                    labelText: 'Cédula',
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: edad,
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Edad',
                    border: OutlineInputBorder(),
                    labelText: 'Edad',
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: genero,
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Género',
                    border: OutlineInputBorder(),
                    labelText: 'Género',
                  ),
                ),
                SizedBox(height: 5.0),
                TextFormField(
                  controller: telefono,
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Teléfono',
                    border: OutlineInputBorder(),
                    labelText: 'Teléfono',
                  ),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  width: screenWidth - 30,
                  height: 30,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                        )
                      ]),
                  child: DropdownButton(
                      hint: Text('Seleccione la EPS: '),
                      value: valueChoose1,
                      isExpanded: true,
                      items: epss.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose1 = newValue;
                        });
                      }),
                ),
                SizedBox(height: 5.0),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  width: screenWidth - 30,
                  height: 30,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                        )
                      ]),
                  child: DropdownButton(
                      hint: Text('Seleccione el Rol: '),
                      value: valueChoose2,
                      isExpanded: true,
                      items: rol.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose2 = newValue;
                        });
                      }),
                ),
                ElevatedButton.icon(
                  icon: Icon(Icons.account_circle_outlined),
                  onPressed: () {
                    Registrar();
                    /*                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lobby())); */
                  },
                  label: Text("Registrar"),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                ),

                /* 
                Text(
                  "Nombre",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: nombre,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su nombre',
                    border: OutlineInputBorder(),
                  ),
                ),
                Text(
                  "Cedula",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: cedula,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su cedula',
                    border: OutlineInputBorder(),
                  ),
                ),
                Text(
                  "Edad",
                  style: TextStyle(fontSize: 18.0),
                ),
                TextField(
                  controller: edad,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su edad',
                    border: OutlineInputBorder(),
                  ),
                ),
                Text(
                  "eps",
                  style: TextStyle(fontSize: 18.0),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                  width: screenWidth - 30,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                        )
                      ]),
                  child: DropdownButton(
                      hint: Text('Seleccione la EPS: '),
                      value: valueChoose,
                      isExpanded: true,
                      items: epss.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      }),
                ),
                ElevatedButton(
                    onPressed: () {
                      print(edad.text);
                      Registrar();
/*                       Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home())); */
                    },
                    child: Text("Registrar"))*/
              ],
            ),
          ),
        ));
  }
}
