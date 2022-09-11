import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Projeto'),
        elevation: 6,
        leading: Icon(Icons.menu),
      ),
      body: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  String? _email;
  String? _password;

  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.people,
            size: MediaQuery.of(context).size.height * 0.4,
          ),
          TextFormField(
            style: TextStyle(fontSize: 19),
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Digite seu e-mail',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String? value) {
              this._email = value;
              print('email=$_email');
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.text,
            style: TextStyle(fontSize: 18),
            decoration: InputDecoration(
              filled: true,
              border: UnderlineInputBorder(),
              icon: Icon(Icons.key),
              hintText: 'Digite sua senha',
              labelText: "Senha",
            ),
            onSaved: (String? value) {
              this._password = value;
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              OutlinedButton(
                onPressed: () {},
                child: const Text('Esqueceu sua senha?'),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 100,
            child: ElevatedButton(
              child: Text('Entrar'),
              onPressed: () {
                if (_email == true && _password == true) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Projeto'),
                      content: Text('Login efetuado com sucesso!'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                } else if (_email == null && _password == null) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Projeto'),
                      content: Text('Dados de acesso incorretos'),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
