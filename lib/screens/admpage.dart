
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restauranteapp/database/menuDatabase.dart';
import 'package:restauranteapp/model/cardapio.dart';

import 'alterpage.dart';

class AdmPage extends StatefulWidget {
  @override
  _AdmPageState createState() => _AdmPageState();
}

class _AdmPageState extends State<AdmPage> {

  List<Cardapio> admcard = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ADM ADJUST"),
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AlterPage();
            }));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        body: ListView.builder(
            padding: EdgeInsets.all(10.0),
            itemCount: admcard.length,
            itemBuilder: (context, index) {
              return _AdmCard(context, index);
            }));
  }



  Widget _AdmCard(BuildContext context, index) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                admcard[index].name ?? "",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text(
                admcard[index].descricao ?? "",
                style: TextStyle(fontSize: 19.0),
              ),
              Text(
                admcard[index].preco ?? "",
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
      onTap: (){
        _showOptions(context, index);
      },
    );
  }


  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min ,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Editar",
                          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20.0),
                        ),
                        onPressed: (){
                          // Navigator.pop(context);
                          // _showAlterPage(cardapio: admcard[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Excluir",
                          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20.0),
                        ),
                        onPressed: (){
                          deleteCardapio(admcard[index].id);
                          setState(() {
                            admcard.removeAt(index);
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        });
  }


  // void _showAlterPage({Cardapio cardapio}) async {
  //   final recCardapio = await Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => AlterPage(
  //                 cardapio: cardapio,
  //               )));
  //   if (recCardapio != null) {
  //     if (cardapio != null) {
  //       await updateCardapio(recCardapio);
  //     } else {
  //       await saveCardapio(recCardapio);
  //     }
  //     _getAllCardapio();
  //   }
  // }

//   void _getAllCardapio() {
//     getAllCardapio().then((list) {
//       setState(() {
//         admcard = list;
//       });
//     });
//   }
// }
}