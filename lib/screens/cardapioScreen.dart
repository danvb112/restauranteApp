import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restauranteapp/database/menuDatabase.dart';
import 'package:restauranteapp/model/cardapio.dart';
import 'admpage.dart';

class CardapioScreen extends StatefulWidget {
  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Delivery"),
            backgroundColor: Colors.deepOrangeAccent,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.build),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdmPage()));
                },
              )
            ]),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.shopping_cart),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: FutureBuilder<List<Cardapio>>(
            initialData: List<Cardapio>(),
            future: findAllCardapio(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;

                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text('Loading')
                      ],
                    ),
                  );

                case ConnectionState.active:
                  break;

                case ConnectionState.done:
                  final List<Cardapio> cardapios = snapshot.data;
                  return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemCount: cardapios.length,
                      itemBuilder: (context, index) {
                        final Cardapio cardapio = cardapios[index];
                        return _CardapioItem(cardapio);
                      });
                  break;
              }
            }));
  }

}

class _CardapioItem extends StatelessWidget {
  final Cardapio cardapio;

  _CardapioItem(this.cardapio);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.green,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cardapio.name,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text(
                cardapio.descricao,
                style: TextStyle(fontSize: 19.0),
              ),
              Text(
                cardapio.preco,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
      // onDismissed: (direction){
      //   setState(() {
      //     final snack = SnackBar(
      //       content: Text("Item $cardapios[name]}\" adicionada!"),
      //       action: SnackBarAction(label: "Desfazer",
      //           onPressed: (){}),
      //       duration:  Duration(seconds: 4),
      //     );
      //     Scaffold.of(context).removeCurrentSnackBar();
      //     Scaffold.of(context).showSnackBar(snack);
      //   });
      // },
    );
  }
}
