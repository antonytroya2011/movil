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
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/estudiantes');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.school, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Estudiantes",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/vcarrera');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.green,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Docentes",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/vdocente');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.red,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.book, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Carrera",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/vmateria');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.orange,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.subject, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Materias",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/start');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.purple,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.nature, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Jardineria",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/begin');
              },
              style: TextButton.styleFrom(
                side: const BorderSide(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.yellow,
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.work, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    "Taller en clase",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
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
