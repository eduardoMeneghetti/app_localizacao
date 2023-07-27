import "package:app_localizacao/formParc.dart";
import "package:flutter/material.dart";

class HomeUser extends StatelessWidget {
  const HomeUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cassul Distribuidora'),
        backgroundColor: Colors.green.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Apertaram no botão');
        },
        child: Icon(Icons.add_location),
        backgroundColor: Colors.green.shade300,
      ),
      body: FormParc(),
    );
  }
}
