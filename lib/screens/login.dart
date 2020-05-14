import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteapp/screens/register.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: SingleChildScrollView(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/mulher_cozinhando.jpg'),
              fit: BoxFit.cover
            
            )
          ),
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
                InputLogin(
                  labelText: 'Login',
                  obscureText: false,
                  icon: Icons.person,
                ),
                InputLogin(
                  labelText: 'Senha',
                  obscureText: true,
                  icon: Icons.lock,
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
                        onPressed: () {},
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

class InputLogin extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final IconData icon;

  InputLogin({@required this.labelText, this.obscureText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextField(
          obscureText: obscureText,
          style: TextStyle(fontSize: 24, color: Colors.black),
          decoration: InputDecoration(
            fillColor: Colors.white,
            icon: Icon(icon),
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
