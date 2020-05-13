import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            InputText(
              labelText: 'Nome',
              hintText: 'Daniel',
              keyBoardType: TextInputType.text,
            ),
            InputText(
              labelText: 'Email',
              hintText: 'nome@email.com',
              keyBoardType: TextInputType.emailAddress,
            ),
            InputText(
              labelText: 'Endereço',
              hintText: 'Rua fulana, numero 200',
              keyBoardType: TextInputType.text,
            ),
            InputText(
              labelText: 'CPF',
              hintText: '123.456.789-69',
              keyBoardType: TextInputType.number,
            ),
            InputText(
              labelText: 'Telefone',
              hintText: '(81)98654213',
              keyBoardType: TextInputType.number,
            ),
            
            RaisedButton(
              child: Text("Finalizar Cadastro"),
              color: Colors.indigo[900],
              textColor: Colors.white,
              onPressed: (){},  
              )
          ],
        ),
      ),
    );
  }
}


class InputText extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyBoardType;
  final TextEditingController _inputController = TextEditingController();
  InputText({@required this.labelText, this.hintText, this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _inputController,
        keyboardType: keyBoardType,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
