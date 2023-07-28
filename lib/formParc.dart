import "package:flutter/material.dart";

class FormParc extends StatefulWidget {
  const FormParc({super.key});

  @override
  State<FormParc> createState() => _FormParcState();
}

class _FormParcState extends State<FormParc> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Código do Parceiro',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String dadosUser = _controller.text;
                    print('O usuário digitou $dadosUser');
                  },
                  child: Text('Pesquisar'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.green.shade300)),
                ),
              ],
            ),
          )),
    );
  }
}
