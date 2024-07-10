import 'package:flutter/material.dart';
import 'package:unit2/entities/garden_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class GardenUpdate extends StatefulWidget {
  const GardenUpdate({super.key});

  @override
  State<GardenUpdate> createState() => _GardenUpdateState();
}

class _GardenUpdateState extends State<GardenUpdate> {
  final gardenForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final typeControl = TextEditingController();
  final amountControl = TextEditingController();
  final priceControl = TextEditingController();
  final originControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final garden = ModalRoute.of(context)?.settings.arguments as Garden;
    nameControl.text = garden.name;
    typeControl.text = garden.type;
    amountControl.text = garden.amount.toString();
    priceControl.text = garden.price;
    originControl.text = garden.origin;
    int id = garden.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Planta'),
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
                      Navigator.of(context).pushNamed('/vjardin');

                      update(id);
                    },
                    child: const Text('Editar Flor')),
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

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (gardenForm.currentState!.validate()) {
      gardenForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Garden(
          id: id,
          name: nameControl.text,
          type: typeControl.text,
          amount: int.parse(amountControl.text),
          price: priceControl.text,
          origin: originControl.text);

      // ignore: avoid_print
      print(await DbConnection.update('garden', data.toDictionary(), id));
    }
  }
}
