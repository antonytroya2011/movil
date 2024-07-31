import 'package:flutter/material.dart';
import 'package:unit2/entities/country_entity.dart';

class ListaPais extends StatefulWidget {
  const ListaPais({super.key});

  @override
  State<ListaPais> createState() => _ListaPaisCreateState();
}

class _ListaPaisCreateState extends State<ListaPais> {
  late Future<List<Country>> countries;

  @override
  void initState() {
    super.initState();
    countries = Country.get();
    // ignore: avoid_print
    print(countries);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(
              'Lista Paises',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<List<Country>>(
        future: countries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var country = snapshot.data![index];
                return ListTile(
                  title: Text(country.region as String),
                );
              },
            );
          }
        },
      ),
    );
  }
}
