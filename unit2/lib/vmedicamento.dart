import 'package:flutter/material.dart';
import 'package:unit2/entities/medication_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class Medicamentos extends StatefulWidget {
  const Medicamentos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicamentosState createState() => _MedicamentosState();
}

class _MedicamentosState extends State<Medicamentos> {
  late Future<List<Medication>> _futureMedications;

  @override
  void initState() {
    super.initState();
    _loadMedications();
  }

  void _loadMedications() {
    setState(() {
      _futureMedications = Medication.select();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Medicamentos"),
        ),
      ),
      body: FutureBuilder<List<Medication>>(
        future: _futureMedications,
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
            List<Medication> data = snapshot.data as List<Medication>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            // ignore: sort_child_properties_last
                            child: Text(
                              data[i].name[0].toUpperCase(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[i].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Descripción: ${data[i].description}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Cantidad: ${data[i].amount}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Lote: ${data[i].batch}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Proveedor: ${data[i].supplier}',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                      '/medication/update',
                                      arguments: data[i]);
                                },
                                icon: const Icon(
                                  Icons.edit_square,
                                  color: Color.fromARGB(255, 233, 213, 35),
                                ),
                              ),
                              IconButton(
                                onPressed: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text("Eliminar Registro"),
                                    content: const Text(
                                        "Estás seguro que quieres eliminar el registro?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          await DbConnection.delete(
                                              'medication', data[i].id as int);
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pop();
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pop();
                                          // ignore: use_build_context_synchronously
                                          Navigator.pushNamed(
                                              // ignore: use_build_context_synchronously
                                              context,
                                              '/vmedicamento');
                                        },
                                        child: const Text("Aceptar"),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, "Cancel");
                                        },
                                        child: const Text("Cancelar"),
                                      ),
                                    ],
                                  ),
                                ),
                                icon: const Icon(
                                  Icons.delete_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/medication/create');
          _loadMedications(); // Se hace un reload
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
