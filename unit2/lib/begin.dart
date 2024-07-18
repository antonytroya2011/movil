import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Begin extends StatelessWidget {
  const Begin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Text(
            "Medicamentos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome"),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "images/medicamento.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/vmedicamento');
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
