import 'package:crud_app_prueba/models/reg_model.dart';
import 'package:crud_app_prueba/models/usuarios_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';
import 'package:path/path.dart';

class BaseDatosLocal {
/*  Crea base de datos en memoria caché del dispositivo */
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'core.db'),
        onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE tb_usuarios (id INTEGER PRIMARY KEY, nombre TEXT, edad INTEGER, documento TEXT, genero TEXT, telefono TEXT, eps TEXT, rol TEXT)");
      await db.execute(
          "CREATE TABLE logg (id INTEGER PRIMARY KEY, nombre TEXT, pass TEXT)");
    }, version: 1);
  }

/*  Consulta para el acceso en el login */
  static login(nombre, pass) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> login = await database.rawQuery(
        'SELECT * FROM logg WHERE nombre="' +
            nombre +
            '" AND pass="' +
            pass +
            '"');
    return login;
  }

/*  Crea usuario para acceder a la app */
  static CrearUsuarios(CrearUsuario crearUsuario, nombre, pass) async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> cuenta = await database.rawQuery(
        'SELECT * FROM logg WHERE nombre="' +
            nombre +
            '" AND pass="' +
            pass +
            '"');
    if (cuenta.isEmpty) {
      return database.insert("logg", crearUsuario.toMap());
    } else {
      print("Usuario ya se creó");
    }
  }

/* Lista toda la base de datos */
  static Listado() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> ListadoMap =
        await database.rawQuery('SELECT tb_usuarios.* FROM tb_usuarios');
    return ListadoMap;
  }

/* Almacena el reistro */
  static guardarRegistro(RegistroPData registroPData) async {
    Database database = await _openDB();
    return database.insert('tb_usuarios', registroPData.toMap());
  }

  /* Modifica por id */
  static ModificarP(RegistroPData registroPData, id) async {
    Database database = await _openDB();
    return database.update("tb_usuarios", registroPData.toMap1(),
        where: '$id=?', whereArgs: [id]);
  }

  /* Borrar por id */
  static BorrarDato(id) async {
    Database database = await _openDB();
    await database
        .rawQuery('DELETE FROM tb_usuarios WHERE id="' + id.toString() + '"');
  }
/* fin */
}
