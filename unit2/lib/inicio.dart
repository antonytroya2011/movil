import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Text(
            "Evaluación",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Bienvenido"),
              const SizedBox(
                height: 35,
              ),
              Image.asset(
                "images/escolastico.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/views');
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
        ],
      )),
    );
  }
}
