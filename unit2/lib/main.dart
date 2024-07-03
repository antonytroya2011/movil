import 'package:flutter/material.dart';
import 'package:unit2/crear.dart';
import 'package:unit2/estudiantes.dart';
import 'package:unit2/inicio.dart';
import 'package:unit2/vcarrera.dart';
import 'package:unit2/vdocente.dart';
import 'package:unit2/views/career/newc.dart';
import 'package:unit2/views/student/new.dart';
import 'package:unit2/views/subject/news.dart';
import 'package:unit2/views/teacher/newt.dart';
import 'package:unit2/vmateria.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => const Inicio(),
        '/estudiantes': (context) => const Estudiantes(),
        '/crear': (context) => const Crear(),
        '/student/create': (context) => const EstudentCreate(),
        '/career/create': (context) => const CareerCreate(),
        '/subject/create': (context) => const SubjectCreate(),
        '/teacher/create': (context) => const TeacherCreate(),
        '/vdocente': (context) => const Carreras(),
        '/vmateria': (context) => const Materias(),
        '/vcarrera': (context) => const Docentes(),
      },
    );
  }
}
