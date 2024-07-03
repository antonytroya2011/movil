import 'package:flutter/material.dart';
import 'package:unit2/entities/career_entity.dart';

class Carreras extends StatelessWidget {
  const Carreras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Carreras"),
        ),
      ),
      body: FutureBuilder<List<Career>>(
        future: Career.select(),
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
            List<Career> data = snapshot.data as List<Career>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].description} ${data[i].durationYears} ${data[i].degreeAwarded} ${data[i].department}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/career/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
