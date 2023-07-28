import "package:app_localizacao/formParc.dart";
import "package:app_localizacao/localizacaoUser.dart";
import "package:flutter/material.dart";

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cassul Distribuidora'),
        backgroundColor: Colors.green.shade300,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserLocalizacao userLocalizacao = UserLocalizacao();
          userLocalizacao.getPosicao();
        },
        child: Icon(Icons.add_location),
        backgroundColor: Colors.green.shade300,
      ),
      body: FormParc(),
    );
  }
}
