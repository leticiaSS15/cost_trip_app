import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/pages/cadastrar_veiculo.dart';
import 'package:cost_trip/pages/visualizar_viagem.dart';
import 'package:cost_trip/views/cadastro_veiculo_form.dart';
import 'package:cost_trip/views/view_viagem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardViewViagem extends StatelessWidget{
  final String rota;

  const CardViewViagem({Key? key, required this.rota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Viajem viagem = Provider.of<Viajem>(context, listen: false);
    return Dismissible(
      key: ValueKey(viagem.id),
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
                    Text('DESTINO'),
                    Spacer(),
                    Text('DATA DE IDA:'),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text("${viagem.destino}",
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      Spacer(),
                      Text("${viagem.dataIda}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: (){
            if(rota == 'veiculo'){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CadastroVeiculo(edit: false,)));
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => VisualizarViagem(tela: rota, viagem: viagem,)));
            }
          },
        ),
      ),
    );
  }


}