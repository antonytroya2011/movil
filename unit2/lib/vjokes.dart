import 'package:flutter/material.dart';
import 'package:unit2/entities/jokes_entity.dart';

class ListaChiste extends StatefulWidget {
  const ListaChiste({super.key});

  @override
  State<ListaChiste> createState() => _ListaChisteCreateState();
}

class _ListaChisteCreateState extends State<ListaChiste> {
  late Future<Joke?> joke;

  @override
  void initState() {
    super.initState();
    joke = Joke.get();
  }

  Future<void> _refreshJoke() async {
    setState(() {
      joke = Joke.get();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The best jokes',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Joke?>(
        future: joke,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            var joke = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (joke.type == 'single')
                  Text(
                    joke.joke!,
                    style: const TextStyle(fontSize: 24),
                  )
                else if (joke.type == 'twopart')
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        joke.setup!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        joke.delivery!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ],
            );
          } else {
            return const Center(
              child: Text("No jokes found."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshJoke,
        // ignore: sort_child_properties_last
        child: const Icon(Icons.refresh),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}
