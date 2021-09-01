import 'package:crud_app_prueba/db/database_crud.dart';
import 'package:crud_app_prueba/models/reg_model.dart';
import 'package:crud_app_prueba/ui/screens/Listado.dart';
import 'package:flutter/material.dart';

class ModifiPage extends StatefulWidget {
  String nombre;
  String documento;
  String eps;
  String telefono;
  String genero;
  String rol;
  int edad;
  int id;

  ModifiPage({
    required this.id,
    required this.nombre,
    required this.documento,
    required this.eps,
    required this.genero,
    required this.rol,
    required this.telefono,
    required this.edad,
  });

  @override
  _ModifiPage createState() => _ModifiPage();
}

class _ModifiPage extends State<ModifiPage> {
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

  Future Modificar() async {
    if (nombre.text.isEmpty ||
        edad.text.isEmpty ||
        documento.text.isEmpty ||
        genero.text.isEmpty ||
        telefono.text.isEmpty ||
        valueChoose2 == null ||
        valueChoose1 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error. Verifique la información")));
    } else {
      BaseDatosLocal.ModificarP(
          RegistroPData(
              nombre: nombre.text,
              documento: documento.text,
              genero: genero.text,
              rol: valueChoose1.toString(),
              telefono: telefono.text,
              eps: valueChoose2.toString(),
              edad: edad.text),
          widget.id);

      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ListadoPage()));

      /* //print("object");
      Uri urllogin = Uri.parse("http://192.168.1.84/test/actualizar.php");
      final response = await http.post(urllogin, body: {
        "id": widget.id.toString(),
        "nombre": nombre.text,
        "documento": documento.text,
        "edad": int.parse(edad.text).toString(),
        "eps": valueChoose.toString(),
      });
      print(response.body);

      if (response.statusCode == 200) {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PacientesPage()));
      }
    } */
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(microseconds: 1)).then((value) {
      setState(() {
        edad.text = widget.edad.toString();
        nombre.text = widget.nombre.toString();
        genero.text = widget.genero.toString();
        telefono.text = widget.telefono.toString();
        valueChoose2 = widget.eps;
        valueChoose1 = widget.rol;
        documento.text = widget.documento.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    print(widget.id);
    return Scaffold(
        key: _scaffoldkey,
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListadoPage()));
            },
          ),
          backgroundColor: Colors.teal,
          title: Text('Modificar Datos'),
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
                      value: valueChoose2,
                      isExpanded: true,
                      items: epss.map((valueItem) {
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
                      value: valueChoose1,
                      isExpanded: true,
                      items: rol.map((valueItem) {
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
                ElevatedButton.icon(
                  icon: Icon(Icons.account_circle_outlined),
                  onPressed: () {
                    Modificar();
                    /*                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Lobby())); */
                  },
                  label: Text("Guardar"),
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
