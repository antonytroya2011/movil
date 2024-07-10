import 'package:flutter/material.dart';
import 'package:unit2/entities/estudent_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class EstudentUpdate extends StatefulWidget {
  const EstudentUpdate({super.key});

  @override
  State<EstudentUpdate> createState() => _EstudentUpdateState();
}

class _EstudentUpdateState extends State<EstudentUpdate> {
  final studentForm = GlobalKey<FormState>();
  final nombreControl = TextEditingController();
  final apellidoControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final student = ModalRoute.of(context)?.settings.arguments as Student;
    nombreControl.text = student.name;
    apellidoControl.text = student.lastName;
    int id = student.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Estudiante'),
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
                        update(id);
                      },
                      child: const Text('Modificar Estudiante')),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              )),
        ));
  }

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (studentForm.currentState!.validate()) {
      studentForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Student(
          id: id, name: nombreControl.text, lastName: apellidoControl.text);
      // ignore: avoid_print
      print(await DbConnection.update('estudiante', data.toDictionary(), id));
    }
  }
}
