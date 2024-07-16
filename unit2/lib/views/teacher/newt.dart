import 'package:flutter/material.dart';
import 'package:unit2/entities/teacher_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class TeacherCreate extends StatefulWidget {
  const TeacherCreate({super.key});

  @override
  State<TeacherCreate> createState() => _TeacherCreateState();
}

class _TeacherCreateState extends State<TeacherCreate> {
  final teacherForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final lastNameControl = TextEditingController();
  final idCardControl = TextEditingController();
  final emailControl = TextEditingController();
  final phoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Docente'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: teacherForm,
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
                  controller: lastNameControl,
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
                TextFormField(
                  controller: idCardControl,
                  decoration: const InputDecoration(labelText: 'Cédula'),
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
                  controller: emailControl,
                  decoration: const InputDecoration(labelText: 'Email'),
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
                  controller: phoneControl,
                  decoration: const InputDecoration(labelText: 'Contacto'),
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
                      Navigator.of(context).pushNamed('/vcarrera');
                      insert();
                    },
                    child: const Text('Insertar Profesor')),
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
                      Navigator.of(context).pushNamed('/student/create');
                    },
                    child: const Text('Ir ingresar Estudiante')),
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
          ),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (teacherForm.currentState!.validate()) {
      teacherForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Teacher(
          name: nameControl.text,
          lastName: lastNameControl.text,
          idCard: idCardControl.text,
          email: emailControl.text,
          phoneNumber: phoneControl.text);

      // ignore: avoid_print
      print(await DbConnection.insert('teachers', data.toDictionary()));
    }
  }
}
