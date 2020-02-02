import 'package:flutter/material.dart';
import 'package:flutter_lesson4/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        accentColor: AppColors.accent,
      ),
      home: UfrgsMobile(),
    );
  }
}

class UfrgsMobile extends StatelessWidget {
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
              decoration: InputDecoration(
                  hintText: 'Cartao UFRGS', border: OutlineInputBorder()),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Senha', border: OutlineInputBorder()),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: RaisedButton(
                color: AppColors.primary,
                onPressed: () {},
                child: Text(
                  'Entrar',
                  style: TextStyle(color: AppColors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
