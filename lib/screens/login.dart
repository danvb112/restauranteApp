import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteapp/components/dialogs.dart';
import 'package:restauranteapp/database/appdatabase.dart';
import 'package:restauranteapp/screens/register.dart';
import 'cardapioScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/mulher_cozinhando.jpg'),
                  fit: BoxFit.cover)),
          child: Container(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Bem vindo ao RestauranteApp',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _loginController,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        icon: Icon(Icons.person),
                        labelText: 'Login',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 300,
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(fontSize: 24, color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        icon: Icon(Icons.lock),
                        labelText: 'Senha',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text('Confirmar'),
                        color: Colors.indigo[900],
                        textColor: Colors.white,
                        onPressed: () async {
                          final String emailLogin = _loginController.text;
                          final String passwordLogin = _passwordController.text;
                          if (await verificationLogin(emailLogin: emailLogin, passwordLogin: passwordLogin)) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return CardapioScreen();
                            }));
                          }else{_showFailDialog(context);}
                          
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                          child: Text('Criar uma nova conta'),
                          color: Colors.indigo[900],
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Register();
                            }));
                          }),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


void _showFailDialog(BuildContext context){
  showDialog(
    context: context,
    builder: (contextDialog){
      return FaildDialog();
    }
  );
}
