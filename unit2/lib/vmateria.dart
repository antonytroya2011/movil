import 'package:flutter/material.dart';
import 'package:unit2/entities/Subject_entity.dart';

class Materias extends StatelessWidget {
  const Materias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Materias"),
        ),
      ),
      body: FutureBuilder<List<Subject>>(
        future: Subject.select(),
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
            List<Subject> data = snapshot.data as List<Subject>;
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
                              'Nombre:${data[i].name}\nCódigo ${data[i].code}\nCreditos: ${data[i].credits}\nSemestre ${data[i].semester}\nInstructor ${data[i].instructor}'),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/subject/update',
                                  arguments: data[i]);
                            },
                            icon: const Icon(Icons.edit_outlined)),
                        IconButton(
                            onPressed: () {},
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
          Navigator.of(context).pushNamed('/subject/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
