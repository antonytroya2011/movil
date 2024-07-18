import 'package:flutter/material.dart';
import 'package:unit2/begin.dart';
import 'package:unit2/crear.dart';
import 'package:unit2/estudiantes.dart';
import 'package:unit2/inicio.dart';
import 'package:unit2/menu.dart';
import 'package:unit2/personaldata.dart';
import 'package:unit2/start.dart';
import 'package:unit2/vcarrera.dart';
import 'package:unit2/vdocente.dart';
import 'package:unit2/views.dart';
import 'package:unit2/views/career/newc.dart';
import 'package:unit2/views/career/update.dart';
import 'package:unit2/views/garden/newg.dart';
import 'package:unit2/views/garden/update.dart';
import 'package:unit2/views/medication/newm.dart';
import 'package:unit2/views/medication/updatem.dart';
import 'package:unit2/views/student/new.dart';
import 'package:unit2/views/student/update.dart';
import 'package:unit2/views/subject/news.dart';
import 'package:unit2/views/subject/update.dart';
import 'package:unit2/views/teacher/newt.dart';
import 'package:unit2/views/teacher/update.dart';
import 'package:unit2/vjardin.dart';
import 'package:unit2/vmateria.dart';
import 'package:unit2/vmedicamento.dart';

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
        '/menu': (context) => const Menu(),
        '/crear': (context) => const Crear(),
        '/views': (context) => const Views(),
        '/start': (context) => const Start(),
        '/begin': (context) => const Begin(),
        '/personaldata': (context) => const Personal(),
        '/student/create': (context) => const EstudentCreate(),
        '/career/create': (context) => const CareerCreate(),
        '/subject/create': (context) => const SubjectCreate(),
        '/teacher/create': (context) => const TeacherCreate(),
        '/garden/create': (context) => const GardenCreate(),
        '/medication/create': (context) => const MedicationCreate(),
        '/student/update': (context) => const EstudentUpdate(),
        '/career/update': (context) => const CareerUpdate(),
        '/subject/update': (context) => const SubjectUpdate(),
        '/teacher/update': (context) => const TeacherUpdate(),
        '/garden/update': (context) => const GardenUpdate(),
        '/medication/update': (context) => const MedicationUpdate(),
        '/vdocente': (context) => const Carreras(),
        '/vmateria': (context) => const Materias(),
        '/vcarrera': (context) => const Docentes(),
        '/vjardin': (context) => const Jardines(),
        '/vmedicamento': (context) => const Medicamentos(),
      },
    );
  }
}
