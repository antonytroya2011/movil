import 'package:flutter/material.dart';
import 'package:unit2/entities/career_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class CareerUpdate extends StatefulWidget {
  const CareerUpdate({super.key});

  @override
  State<CareerUpdate> createState() => _CareerUpdateState();
}

class _CareerUpdateState extends State<CareerUpdate> {
  final careerForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final durationControl = TextEditingController();
  final degreeControl = TextEditingController();
  final departmentControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final career = ModalRoute.of(context)?.settings.arguments as Career;
    nameControl.text = career.name;
    descriptionControl.text = career.description;
    durationControl.text = career.durationYears.toString();
    degreeControl.text = career.degreeAwarded;
    departmentControl.text = career.department;

    int id = career.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Carrera'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: careerForm,
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
                  decoration: const InputDecoration(labelText: 'Descripcion'),
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
                  controller: durationControl,
                  decoration: const InputDecoration(labelText: 'Duration'),
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
                  controller: degreeControl,
                  decoration: const InputDecoration(labelText: 'Título'),
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
                  controller: departmentControl,
                  decoration: const InputDecoration(labelText: 'Departamento'),
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
                      Navigator.of(context).pushNamed('/vdocente');

                      update(id);
                    },
                    child: const Text('Modificar Carrera')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/vdocente');
                    },
                    child: const Text('Ver carreres'))
              ],
            )),
          ),
        ));
  }

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (careerForm.currentState!.validate()) {
      careerForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Career(
          id: id,
          name: nameControl.text,
          description: descriptionControl.text,
          durationYears: int.parse(durationControl.text),
          degreeAwarded: degreeControl.text,
          department: departmentControl.text);

      // ignore: avoid_print
      print(await DbConnection.update('career', data.toDictionary(), id));
    }
  }
}
