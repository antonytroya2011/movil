import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

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
          mainAxisAlignment:
              MainAxisAlignment.center, // Centra los elementos verticalmente
          children: [
            Image.network(
                "https://sb.kaleidousercontent.com/67418/658x756/361846cee7/all-pages-2.png"),
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
                child: const Text("Bienvenido"))
          ],
        ),
      ),
    );
  }
}
