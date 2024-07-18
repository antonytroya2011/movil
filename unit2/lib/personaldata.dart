import 'package:flutter/material.dart';

class Personal extends StatelessWidget {
  const Personal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Datos personales",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Mi información",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/foto.jpeg",
                height: 150,
                width: 300,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Nombre: Antony Israel Troya Cuzco\n"
                "Edad: 23 años\n"
                "Email: antony.troya2963@utc.edu.ec\n"
                "Contacto: 0984752386\n"
                "Dirección: Latacunga",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
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
                  child: const Text("Inicio"))
            ],
          ),
        ],
      )),
    );
  }
}
