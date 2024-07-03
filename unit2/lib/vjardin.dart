import 'package:flutter/material.dart';
import 'package:unit2/entities/garden_entity.dart';

class Jardines extends StatelessWidget {
  const Jardines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Jardines"),
        ),
      ),
      body: FutureBuilder<List<Garden>>(
        future: Garden.select(),
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
            List<Garden> data = snapshot.data as List<Garden>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].type} ${data[i].amount} ${data[i].price} ${data[i].origin}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/garden/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
