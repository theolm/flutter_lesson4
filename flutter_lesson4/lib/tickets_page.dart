
import 'package:flutter/material.dart';

import 'colors.dart';
import 'repository.dart';
import 'tickets_return.dart';

class TicketsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tickets'),
        backgroundColor: AppColors.primary,
      ),
      body: FutureBuilder(
        future: getTicketsAsync(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            if (snapshot.data == null) {
              return Text('Erro');
            } else {
              return TicketList(snapshot.data);
            }
          }
        },
      ),
    );
  }
}

class TicketList extends StatelessWidget {
  final List<Tiquete> list;

  const TicketList(this.list, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, pos) {
          var ticket = list[pos];

          return Container(
            margin: EdgeInsets.all(16),
            child: Card(
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Nr do ticket: '),
                        Text(
                          ticket.nrtiquete,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Tickets restantes: '),
                        Text(
                          ticket.nrrefeicoesresta,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
