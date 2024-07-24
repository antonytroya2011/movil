import 'package:flutter/material.dart';
import 'package:unit2/entities/garden_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class GardenCreate extends StatefulWidget {
  const GardenCreate({super.key});

  @override
  State<GardenCreate> createState() => _GardenCreateState();
}

class _GardenCreateState extends State<GardenCreate> {
  final gardenForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final typeControl = TextEditingController();
  final amountControl = TextEditingController();
  final priceControl = TextEditingController();
  final originControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Planta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: gardenForm,
            child: SingleChildScrollView(
                child: Column(
              children: [
                TextFormField(
                  controller: nameControl,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: typeControl,
                  decoration: const InputDecoration(labelText: 'Tipo'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: amountControl,
                  decoration: const InputDecoration(labelText: 'Cantidad'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: priceControl,
                  decoration: const InputDecoration(labelText: 'Precio'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: originControl,
                  decoration: const InputDecoration(labelText: 'Origen'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es requerido';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (gardenForm.currentState!.validate()) {
                        insert();
                        Navigator.of(context).pushNamed('/vjardin');
                      }
                    },
                    child: const Text('Insertar Flor')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/vjardin');
                    },
                    child: const Text('Ver flores'))
              ],
            )),
          ),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (gardenForm.currentState!.validate()) {
      gardenForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Garden(
          name: nameControl.text,
          type: typeControl.text,
          amount: int.parse(amountControl.text),
          price: priceControl.text,
          origin: originControl.text);

      // ignore: avoid_print
      print(await DbConnection.insert('garden', data.toDictionary()));
    }
  }
}
