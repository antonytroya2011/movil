import 'package:flutter/material.dart';
import 'package:unit2/entities/estudent_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class EstudentCreate extends StatefulWidget {
  const EstudentCreate({super.key});

  @override
  State<EstudentCreate> createState() => _EstudentCreateState();
}

class _EstudentCreateState extends State<EstudentCreate> {
  final studentForm = GlobalKey<FormState>();
  final nombreControl = TextEditingController();
  final apellidoControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Estudiante'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: studentForm,
              child: Column(
                children: [
                  TextFormField(
                    controller: nombreControl,
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
                    controller: apellidoControl,
                    decoration: const InputDecoration(labelText: 'Apellido'),
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
                        Navigator.of(context).pushNamed('/estudiantes');

                        insert();
                      },
                      child: const Text('Insertar Estudiante')),
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
                        Navigator.of(context).pushNamed('/career/create');
                      },
                      child: const Text('Ir ingresar Carrera'))
                ],
              )),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (studentForm.currentState!.validate()) {
      studentForm.currentState!.save();
      // ignore: unused_local_variable
      var data =
          Student(name: nombreControl.text, lastName: apellidoControl.text);
      // ignore: avoid_print
      print(await DbConnection.insert('estudiante', data.toDictionary()));
    }
  }
}
