import 'package:flutter/material.dart';
import 'package:unit2/entities/teacher_entity.dart';
import 'package:unit2/settings/db_connection.dart';

class TeacherUpdate extends StatefulWidget {
  const TeacherUpdate({super.key});

  @override
  State<TeacherUpdate> createState() => _TeacherUpdateState();
}

class _TeacherUpdateState extends State<TeacherUpdate> {
  final teacherForm = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final lastNameControl = TextEditingController();
  final idCardControl = TextEditingController();
  final emailControl = TextEditingController();
  final phoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final teacher = ModalRoute.of(context)?.settings.arguments as Teacher;

    nameControl.text = teacher.name;
    lastNameControl.text = teacher.lastName;
    idCardControl.text = teacher.idCard;
    emailControl.text = teacher.email;
    phoneControl.text = teacher.phoneNumber;
    int id = teacher.id as int;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Docente'),
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
                      update(id);
                    },
                    child: const Text('Modificar Profesor')),
              ],
            )),
          ),
        ));
  }

  update(int id) async {
    // ignore: avoid_print
    print('Llegue a la funcion');
    if (teacherForm.currentState!.validate()) {
      teacherForm.currentState!.save();
      // ignore: unused_local_variable
      var data = Teacher(
          id: id,
          name: nameControl.text,
          lastName: lastNameControl.text,
          idCard: idCardControl.text,
          email: emailControl.text,
          phoneNumber: phoneControl.text);

      // ignore: avoid_print
      print(await DbConnection.update('teachers', data.toDictionary(), id));
    }
  }
}
