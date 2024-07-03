import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbConnection {
  static const version = 1; // version de conexion, por default va siempre 1
  static const dbName = 'octavo_utc.db'; //nombre de la base de datos sqlite

  static Future<Database> getConnection() async {
    return openDatabase(
        join(
            //concatenar la ruta absoluta con el nombre de la base de datos)
            await getDatabasesPath(), //llamar a funcion asincrona que contiene una ruta bdd estandar
            dbName // nombre de la base de datos en este caso octavo_utc.db
            ),
        onCreate: (db, version) async => {
              //evento para crear la base de datos
              //primer parametro
              //segundo parametro hace referencia a la version que esta en la linea 5
              //en esta funcion se crean tablas o datos iniciales

              // creacion de la tabla estudiante con lenguaje sql usando el método execute

              await db.execute(
                  "CREATE TABLE estudiante(id INTEGER PRIMARY KEY, name TEXT, last_name Text)"),
              await db
                  .execute("INSERT INTO estudiante VALUES(1,'ANTONY','TROYA')"),

              // creacion de la tabla teachers con lenguaje sql usando el método execute
              await db.execute(
                  "CREATE TABLE teachers(id INTEGER PRIMARY KEY, name TEXT, last_name Text, id_card Text,  email Text, phone_nunmber TEXT )"),
              await db.execute(
                  "INSERT INTO teachers VALUES(1,'DIEGO','FALCONI','0503032963','diego@gmail.com', '0984752383')"),

              // creacion de la tabla subject con lenguaje sql usando el método execute
              await db.execute(
                  "CREATE TABLE subject(id INTEGER PRIMARY KEY, name TEXT, code Text, credits INTEGER, semester TEXT, instructor TEXT)"),
              await db.execute(
                  "INSERT INTO subject VALUES(1,'PROGRAMACION','PG-07','5','Octavo', 'Diego Falconi')"),

              // creacion de la tabla career con lenguaje sql usando el método execute
              await db.execute(
                  "CREATE TABLE career(id INTEGER PRIMARY KEY, name TEXT, description Text, duration_years INTEGER, degree_awarded TEXT, department TEXT)"),
              await db.execute(
                  "INSERT INTO career VALUES(1,'Sistemas de Informacion','Sistema de Información en la UTC',5,'Ing.Sistemas de Información', 'CIYA')")
            },
        version: version);
    // declarar una funcion asincrona llamada getConnection()
  } // devuelve el tipo de dato llamado Database

  static Future<int> insert(String table, dynamic data) async {
    // creacion del metodo insert
    //primer parametro nombre de la tabla
    //segundo parametro hace referencia a la data
    final db = await getConnection(); // llamado  a la funcion de conexion
    return db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    //paso los parametros de la tabla y de data
  }

  static Future<int> update(String table, dynamic data, int id) async {
    final db = await getConnection(); // llamado  a la funcion de conexion
    return db.update(
        table, // nombre de la tabla
        data, // data actualizar
        where: 'id=?' // where del argumento que en este caso es el id
        ,
        whereArgs: [id]); // llamando a la variable del id
  }

  static Future<int> delete(String table, dynamic data, int id) async {
    final db = await getConnection(); // llamado  a la funcion de conexion
    return db.delete(table, where: 'id=?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> list(String table) async {
    //Funcion para listar datos de una tabla
    //Primer parametro es nombre de la tabla
    //Retorna una lista de diccionarios
    final db = await getConnection(); //llamado a la función de conexión
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> detail(
      String table, String where, dynamic args) async {
    //Funcion para listar datos de una tabla
    //Primer parametro es nombre de la tabla
    //Retorna una lista de diccionarios
    final db = await getConnection(); //llamado a la función de conexión
    return db.query(table, where: where, whereArgs: args);
  }
}
