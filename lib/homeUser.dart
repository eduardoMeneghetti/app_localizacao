import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_localizacao/formParc.dart';
import 'package:app_localizacao/localizacaoUser.dart';

class HomeUser extends StatelessWidget {
  UserLocalizacao _userLocalizacao = UserLocalizacao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cassul Distribuidora'),
        backgroundColor: Colors.green.shade300,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await _userLocalizacao
              .getPosicao(); // Aguarde a obtenção da posição do usuário
          FormParc formParc = FormParc(onCadastroPressed: (codParceio) {
            // Callback chamado quando o botão de cadastro no FormParc for pressionado
            postData(codParceio, _userLocalizacao.lat, _userLocalizacao.long);
          });

          // Mostrar o formulário como um diálogo
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(child: formParc);
            },
          );
        },
        child: Text('Obter localicação'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green.shade300)),
      ),
    );
  }

  Future<void> postData(int codParc, double lat, double long) async {
    var url = 'http://192.168.15.126/crud/';
    var headers = {'Content-Type': 'application/json'};
    var body =
        jsonEncode({'codParc': codParc, 'latitude': lat, 'longitude': long});

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      // caso o status seja positivo
      print('Resposta do servidor: ${response.body}');
    } else {
      // caso a resposta seja contraria a positivo
      print('Falha na solicitação. Código de status: ${response.statusCode}');
    }
  }
}
