import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Jardineria Bengi"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                "https://previews.123rf.com/images/sonulkaster/sonulkaster1702/sonulkaster170200684/72532849-dise%C3%B1o-de-logotipo-de-jardiner%C3%ADa-con-pala-y-rastrillo-con-hojas-verdes.jpg"),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/vjardin');
                },
                style: TextButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text("Bienvenido"))
          ],
        ),
      ),
    );
  }
}
