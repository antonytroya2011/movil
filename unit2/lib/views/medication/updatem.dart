import 'package:flutter/material.dart';
import 'package:unit2/entities/medication_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class MedicationUpdate extends StatefulWidget {
  const MedicationUpdate({super.key});

  @override
  State<MedicationUpdate> createState() => _MedicationUpdateState();
}

class _MedicationUpdateState extends State<MedicationUpdate> {
  final medicationForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final amountControl = TextEditingController();
  final batchControl = TextEditingController();
  final supplierControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final medication = ModalRoute.of(context)?.settings.arguments as Medication;
    nameControl.text = medication.name;
    descriptionControl.text = medication.description;
    amountControl.text = medication.amount.toString();
    batchControl.text = medication.batch;
    supplierControl.text = medication.supplier;
    int id = medication.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Planta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: medicationForm,
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
                  controller: descriptionControl,
                  decoration: const InputDecoration(labelText: 'Descripción'),
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
                  controller: batchControl,
                  decoration: const InputDecoration(labelText: 'Lote'),
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
                  controller: supplierControl,
                  decoration: const InputDecoration(labelText: 'Proveedor'),
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
                      Navigator.of(context).pushNamed('/vmedicamento');

                      update(id);
                    },
                    child: const Text('Editar Medicamento')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/vmedicamento');
                    },
                    child: const Text('Ver Medicamentos'))
              ],
            )),
          ),
        ));
  }

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (medicationForm.currentState!.validate()) {
      medicationForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Medication(
          id: id,
          name: nameControl.text,
          description: descriptionControl.text,
          amount: int.parse(amountControl.text),
          batch: batchControl.text,
          supplier: supplierControl.text);

      // ignore: avoid_print
      print(await DbConnection.update('medication', data.toDictionary(), id));
    }
  }
}
