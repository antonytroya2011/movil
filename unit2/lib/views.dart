import 'package:flutter/material.dart';

class Views extends StatelessWidget {
  const Views({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Sistema Escolástico"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              "images/utc.jpeg",
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Selecciona las opciones donde deseas ir',
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/estudiantes');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Estudiantes")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/vcarrera');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Docentes")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/vdocente');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Carrera")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/vmateria');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Materias")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/start');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Jardineria")),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/begin');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Taller en clase"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/personaldata');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
