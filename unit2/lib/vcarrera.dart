import 'package:flutter/material.dart';
import 'package:unit2/entities/teacher_entity.dart';

class Docentes extends StatelessWidget {
  const Docentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Docentes"),
        ),
      ),
      body: FutureBuilder<List<Teacher>>(
        future: Teacher.select(),
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
            List<Teacher> data = snapshot.data as List<Teacher>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].lastName} ${data[i].idCard} ${data[i].email} ${data[i].phoneNumber}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/teacher/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
