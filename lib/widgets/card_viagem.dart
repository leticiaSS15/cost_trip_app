import 'package:flutter/material.dart';

class CardViewViagem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(0),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete, color: Colors.white, size: 40),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 10.0),
        margin: EdgeInsets.all(5.0),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text('Excluir registro'),
              content: Text('Deseja excluir o registro?'),
              actions: [
                FlatButton(
                  child: Text('Não'),
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Sim'),
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                )
              ],
            )
        );
      },
      onDismissed: (_) {},
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Row(children: <Widget>[
                    Text('VIAGEM A NEGOCIOS'),
                    Spacer(),
                    Text('REALIZADA EM:'),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("BRASILIA",
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Text("25/08/2021"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: (){},
        ),
      ),
    );
  }


}