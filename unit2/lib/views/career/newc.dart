import 'package:flutter/material.dart';
import 'package:unit2/entities/career_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class CareerCreate extends StatefulWidget {
  const CareerCreate({super.key});

  @override
  State<CareerCreate> createState() => _CareerCreateState();
}

class _CareerCreateState extends State<CareerCreate> {
  final careerForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final durationControl = TextEditingController();
  final degreeControl = TextEditingController();
  final departmentControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Carrera'),
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

                      insert();
                    },
                    child: const Text('Insertar Carrera')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/subject/create');
                    },
                    child: const Text('Ir ingresar Materia')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/teacher/create');
                    },
                    child: const Text('Ir ingresar Docente')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/subject/create');
                    },
                    child: const Text('Ir ingresar Estudiante')),
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

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (careerForm.currentState!.validate()) {
      careerForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Career(
          name: nameControl.text,
          description: descriptionControl.text,
          durationYears: int.parse(durationControl.text),
          degreeAwarded: degreeControl.text,
          department: departmentControl.text);

      // ignore: avoid_print
      print(await DbConnection.insert('career', data.toDictionary()));
    }
  }
}
