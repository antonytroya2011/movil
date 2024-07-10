import 'package:flutter/material.dart';
import 'package:unit2/entities/Subject_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class SubjectUpdate extends StatefulWidget {
  const SubjectUpdate({super.key});

  @override
  State<SubjectUpdate> createState() => _SubjectUpdateState();
}

class _SubjectUpdateState extends State<SubjectUpdate> {
  final subjectForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final codeControl = TextEditingController();
  final creditsControl = TextEditingController();
  final semesterControl = TextEditingController();
  final instructorControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final subject = ModalRoute.of(context)?.settings.arguments as Subject;
    nameControl.text = subject.name;
    codeControl.text = subject.code;
    creditsControl.text = subject.credits.toString();
    semesterControl.text = subject.semester;
    instructorControl.text = subject.instructor;
    int id = subject.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Materia'),
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

                      update(id);
                    },
                    child: const Text('Modificar Materia')),
              ],
            )),
          ),
        ));
  }

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (subjectForm.currentState!.validate()) {
      subjectForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Subject(
          id: id,
          name: nameControl.text,
          code: codeControl.text,
          credits: int.parse(creditsControl.text),
          semester: semesterControl.text,
          instructor: instructorControl.text);

      // ignore: avoid_print
      print(await DbConnection.update('subject', data.toDictionary(), id));
    }
  }
}
