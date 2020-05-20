import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteapp/components/dialogs.dart';
import 'package:restauranteapp/database/appdatabase.dart';
import 'package:restauranteapp/model/User.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _controladorNome = TextEditingController();

  final TextEditingController _controladorEmail = TextEditingController();

  final TextEditingController _controladorEndereco = TextEditingController();

  final TextEditingController _controladorCpf = TextEditingController();

  final TextEditingController _controladorTelefone = TextEditingController();

  final TextEditingController _controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Daniel',
              ),
            ),
            TextField(
              controller: _controladorEmail,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'nome@email.com',
              ),
            ),
            TextField(
              controller: _controladorEndereco,
              keyboardType: TextInputType.text,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'Endereço',
                hintText: 'Rua tal, Numero 2200',
              ),
            ),
            TextField(
              controller: _controladorCpf,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: 'CPF',
                hintText: '123.456.789-69',
              ),
            ),
            TextField(
              controller: _controladorTelefone,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: "Telefone",
                hintText: '(81)996541235',
              ),
            ),
            TextField(
              obscureText: true,
              controller: _controladorSenha,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 24,
              ),
              decoration: InputDecoration(
                labelText: "Senha",
                hintText: '....',
              ),
            ),
            RaisedButton(
              child: Text("Finalizar Cadastro"),
              color: Colors.indigo[900],
              textColor: Colors.white,
              onPressed: () {
                final String name = _controladorNome.text;
                final String email = _controladorEmail.text;
                final String address = _controladorEndereco.text;
                final String cpf = _controladorCpf.text;
                final String fone = _controladorTelefone.text;
                final String password = _controladorSenha.text;
                final User newUser =
                    User(name, email, address, cpf, fone, password);
                if (_verificationInputEmpty(newUser)) {
                  save(newUser);
                  findAll();
                  Navigator.pop(context);
                  return _showSucsessDialog(context);
                }
                return _showFaildRegisterDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

bool _verificationInputEmpty(User user) {
  if (user.name.isNotEmpty) {
    if (user.email.isNotEmpty) {
      if (user.address.isNotEmpty) {
        if (user.cpf.isNotEmpty) {
          if (user.fone.isNotEmpty) {
            if (user.password.isNotEmpty) {
              return true;
            }
          }
        }
      }
    }
  }
  print('false');
  return false;
}

void _showSucsessDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (contextDialog) {
        return SucsessDialog();
      });
}


void _showFaildRegisterDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (contextDialog){
      return FaildRegisterDialog();
    }
  );

}
