import 'package:flutter/material.dart';

class DialogModel extends StatelessWidget {
  final String titleDialog;
  final String textDialog;
  final String _textButton = "Confirmar";
  final IconData iconDialog;


  DialogModel({this.titleDialog, this.textDialog, this.iconDialog});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 32,
      title: Visibility(
          child: Text(
            titleDialog,
            textAlign: TextAlign.center,
          )),
          actions: <Widget>[
            FlatButton( 
              onPressed:() => Navigator.pop(context),
              child: Text('Confirmar', style: TextStyle(fontSize: 16),)) 
          ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            textDialog,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24, 8.0, 8.0),
            child: Icon(
              iconDialog,
              color: Colors.indigo[900],
              size: 64,
            ),
          ),
         
        ],
      ),
    );
  }
}

class FaildDialog extends StatelessWidget {
  final String _titleDialog = 'Falha no Login';
  final String _textDialog = 'Email ou Senha incorretos, tente novamente';
  final IconData _iconDialog = Icons.warning;
  @override
  Widget build(BuildContext context) {
    return DialogModel(
      titleDialog: _titleDialog,
      textDialog: _textDialog,
      iconDialog: _iconDialog,
    );
  }
}

class SucsessDialog extends StatelessWidget {
  final String _titleDialog = 'Sucesso';
  final String _textDialog = 'Cadastro realizado com sucesso';
  final IconData _iconDialog = Icons.done;

  @override
  Widget build(BuildContext context) {
    return DialogModel(
      titleDialog: _titleDialog,
      textDialog: _textDialog,
      iconDialog: _iconDialog,
    );
  }
}


class FaildRegisterDialog extends StatelessWidget{

  final String _titleDialog = 'Falha no cadastro';
  final String _textDialog = 'Todos os campos devem ser preenchidos para realizar o cadastro';
  final IconData _iconDialog = Icons.warning;


  @override
  Widget build(BuildContext context) {
    return  DialogModel(
      titleDialog: _titleDialog,
      textDialog: _textDialog,
      iconDialog: _iconDialog,
    );
  }

}