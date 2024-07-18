import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unit2/entities/estudent_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class Estudiantes extends StatelessWidget {
  const Estudiantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Estudiantes"),
        ),
      ),
      body: FutureBuilder<List<Student>>(
        future: Student.select(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error} "),
            );
          } else {
            // ignore: unused_local_variable
            List<Student> data = snapshot.data as List<Student>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              'Nombre: ${data[i].name}\nApellido: ${data[i].lastName}'),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/student/update',
                                  arguments: data[i]);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text("Eliminar Registro"),
                                      content: const Text(
                                          "Estás seguro que quieres eliminar el registro?"),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await DbConnection.delete(
                                                  'estudiante',
                                                  data[i].id as int);
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).pop();
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).pop();
                                              Navigator.pushNamed(
                                                  // ignore: use_build_context_synchronously
                                                  context,
                                                  '/estudiantes');
                                            },
                                            child: const Text("Aceptar")),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context, "Cancel");
                                            },
                                            child: const Text("Cancelar"))
                                      ],
                                    )),
                            icon: const Icon(Icons.delete_outlined)),
                      ],
                    )),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/student/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
