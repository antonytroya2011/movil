import 'package:flutter/material.dart';
import 'package:unit2/entities/medication_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class Medicamentos extends StatelessWidget {
  const Medicamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Medicamentos"),
        ),
      ),
      body: FutureBuilder<List<Medication>>(
        future: Medication.select(),
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
            List<Medication> data = snapshot.data as List<Medication>;
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
                              'Nombre: ${data[i].name}\nDescripción: ${data[i].description}\nCantidad: ${data[i].amount}\nLote: ${data[i].batch}\nProveedor: ${data[i].supplier}'),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  '/medication/update',
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
                                                  'medication',
                                                  data[i].id as int);
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).pop();
                                              // ignore: use_build_context_synchronously
                                              Navigator.of(context).pop();

                                              Navigator.pushNamed(
                                                  // ignore: use_build_context_synchronously
                                                  context,
                                                  '/vmedicamento');
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
          Navigator.of(context).pushNamed('/medication/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
