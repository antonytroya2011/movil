import 'package:flutter/material.dart';
import 'package:unit2/entities/medication_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class MedicationCreate extends StatefulWidget {
  const MedicationCreate({super.key});

  @override
  State<MedicationCreate> createState() => _MedicationCreateState();
}

class _MedicationCreateState extends State<MedicationCreate> {
  final medicationForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final amountControl = TextEditingController();
  final batchControl = TextEditingController();
  final supplierControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Medicamento'),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (medicationForm.currentState!.validate()) {
                      insert();
                      Navigator.of(context).pushNamed('/vmedicamento');
                    }
                  },
                  child: const Text('Insertar Medicamento'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/vmedicamento');
                  },
                  child: const Text('Ver Medicamentos'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (medicationForm.currentState!.validate()) {
      medicationForm.currentState!.save();
      var data = Medication(
        name: nameControl.text,
        description: descriptionControl.text,
        amount: int.parse(amountControl.text),
        batch: batchControl.text, // Correct assignment
        supplier: supplierControl.text, // Correct assignment
      );

      // ignore: avoid_print
      print(await DbConnection.insert('medication', data.toDictionary()));
    }
  }
}
