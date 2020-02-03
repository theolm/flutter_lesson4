import 'package:flutter/material.dart';

import 'colors.dart';
import 'repository.dart';
import 'tickets_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoaderVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UFRGS Mobile'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _userController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Cartao UFRGS', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: AppColors.primary,
                onPressed: () => login(),
                child: Text(
                  'Entrar',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 32),
            Visibility(
                visible: isLoaderVisible, child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }

  void login() async {
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      isLoaderVisible = true;
    });

    var user = _userController.text;
    var senha = _passwordController.text;

    var res = await apiLogin(user, senha);

    if (res) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TicketsPage(),
          ));
    } else {
      print('erro');
    }

    setState(() {
      isLoaderVisible = false;
    });
  }
}