import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Evaluación Móvil"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Bienvenido',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  "https://www.revistarupturas.com/images/utcinfraestructura.jpg?crc=15102744"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Seleccione a donde se desea redirigir',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/inicio');
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
                    child: const Text("Escolastico")),
                const SizedBox(
                  width: 40,
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
