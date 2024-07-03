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
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPBCTP9HMYjJ95D1uo7PMICWpLizNmN0IaCg&s"),
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
                child: const Text("Materias"))
          ],
        ),
      ),
    );
  }
}
