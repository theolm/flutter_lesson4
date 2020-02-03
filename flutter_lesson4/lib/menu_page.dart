
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'repository.dart';
import 'ru_return.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('UFRGS Mobile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage()
              ));
            },

          ),
        ],
      ),
      body: FutureBuilder(
        future: getMenuAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<RuReturn> list = snapshot.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, pos) {
                  return RuCard(list[pos]);
                });
          }
        },
      ),
    );
  }
}

class RuCard extends StatelessWidget {
  final RuReturn ruReturn;

  const RuCard(this.ruReturn, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Card(
        color: Colors.grey.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.grey.shade400,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                ruReturn.nome,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(ruReturn.fixCardapio)),
          ],
        ),
      ),
    );
  }
}
