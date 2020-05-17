
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restauranteapp/database/menuDatabase.dart';
import 'package:restauranteapp/model/cardapio.dart';



class AlterPage extends StatefulWidget {

  @override
  _AlterPageState createState() => _AlterPageState();
}

class _AlterPageState extends State<AlterPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text("Novo Item"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                focusNode: _nameFocus,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: "Descrição"),
                keyboardType: TextInputType.text,
              ),
              TextField(
                  controller: _precoController,
                  decoration: InputDecoration(labelText: "Preço"),
                  keyboardType: TextInputType.number
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            final String name = _nameController.text;
            final String descricao = _descricaoController.text;
            final String preco = _precoController.text;
            final Cardapio cardapio = Cardapio(name, descricao, preco);
            saveCardapio(cardapio);
            Navigator.pop(context);

          },
          child: Icon(Icons.save),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      ),
    );
  }









  Future<bool> _requestPop(){
    if(_userEdited){
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text('Sim'),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

}