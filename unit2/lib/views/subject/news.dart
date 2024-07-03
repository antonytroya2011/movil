import 'package:flutter/material.dart';
import 'package:unit2/entities/subject_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class SubjectCreate extends StatefulWidget {
  const SubjectCreate({super.key});

  @override
  State<SubjectCreate> createState() => _SubjectCreateState();
}

class _SubjectCreateState extends State<SubjectCreate> {
  final subjectForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final codeControl = TextEditingController();
  final creditsControl = TextEditingController();
  final semesterControl = TextEditingController();
  final instructorControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear Materia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: subjectForm,
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
                  controller: codeControl,
                  decoration: const InputDecoration(labelText: 'Código'),
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
                  controller: creditsControl,
                  decoration: const InputDecoration(labelText: 'Creditos'),
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
                  controller: semesterControl,
                  decoration: const InputDecoration(labelText: 'Semestre'),
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
                  controller: instructorControl,
                  decoration: const InputDecoration(labelText: 'Docente'),
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
                      Navigator.of(context).pushNamed('/vmateria');

                      insert();
                    },
                    child: const Text('Insertar Materia')),
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
          ),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (subjectForm.currentState!.validate()) {
      subjectForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Subject(
          name: nameControl.text,
          code: codeControl.text,
          credits: int.parse(creditsControl.text),
          semester: semesterControl.text,
          instructor: instructorControl.text);

      // ignore: avoid_print
      print(await DbConnection.insert('subject', data.toDictionary()));
    }
  }
}
