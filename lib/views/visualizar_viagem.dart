import 'package:cost_trip/database/db_acomodacao.dart';
import 'package:cost_trip/database/db_viagens.dart';
import 'package:cost_trip/modelo/acomodacao.dart';
import 'package:cost_trip/modelo/transporte.dart';
import 'package:cost_trip/modelo/viagem.dart';
import 'package:cost_trip/servico/servico_viagens.dart';
import 'package:cost_trip/views/edit_form.dart';
import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ViewViagem extends StatefulWidget {

  final String tela;
  final Viagem viagem;
  final Acomodacao acomodacao;
  final Transporte transporte;

  const ViewViagem({Key? key, required this.tela, required this.viagem, required this.acomodacao, required this.transporte}) : super(key: key);

  @override
  _ViewViagemState createState() => _ViewViagemState();
}

class _ViewViagemState extends State<ViewViagem> {

  var controller = new TextEditingController();
  bool _edicao = false;
  final DbViagens viagens = DbViagens();
  final DbAcomodacao _acomodacao = DbAcomodacao();
  final ServicoViagem _servicoViagem = ServicoViagem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 5.0),
              child: TextFormField(
                enabled: _edicao,
                initialValue: widget.viagem.destino,
                decoration: InputDecoration(
                  labelText: 'Destino',
                    focusColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.location_on)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.viagem.dataIda,
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Data de ida',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range)),
                    ),
                  ),
                  SizedBox(width: 70.0),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.viagem.dataVolta,
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Data de retorno',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range_outlined)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.viagem.horarioIda,
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Horário de ida',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.access_time)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.viagem.horarioVolta,
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Horário de retorno',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.access_time_sharp)),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.transporte.total_gastos_transporte.toString(),
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Total gasto',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.directions_car)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Transporte'),
                      onPressed: (){
                        if(widget.tela == 'historico' || widget.tela == 'checkin') {
                          null;
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditForm(edit_page: 'Transporte', acomodacao: widget.acomodacao, transporte: widget.transporte)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.acomodacao.total_gastos_acomodacao.toString(),
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Total gasto',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.bedtime)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: ElevatedButton(
                      child: Text('Acomodação'),
                      onPressed: (){
                        if(widget.tela == 'historico' || widget.tela == 'checkin') {
                          null;
                        } else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditForm(edit_page: 'Acomodação', acomodacao: widget.acomodacao, transporte: widget.transporte,)));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.viagem.gastos_previstos.toString(),
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Orçamento limite',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.attach_money_rounded)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      initialValue: (widget.transporte.total_gastos_transporte + widget.acomodacao.total_gastos_acomodacao).toString(),
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Total gasto',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.money_off_sharp)),
                    ),
                  ),
                ],
              ),
            ),

            if(widget.tela == 'historico') Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: 'Realizado',
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Check-in',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      initialValue: 'Realizado',
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: 'Check-out',
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range_outlined)),
                    ),
                  ),
                ],
              ),
            ),
            if(widget.tela == 'visualizar') Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Realizar check-in",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                color: Colors.greenAccent,
                onPressed: (){
                  viagens.makeChek_in(widget.viagem);
                },
              ),
            ),
            if(widget.tela == 'checkin') Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: 'Realizado',
                      enabled: _edicao,
                      decoration: InputDecoration(
                        labelText: ('Check-in'),
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.check_circle)),
                    ),
                  ),
                  SizedBox(width: 100,),
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Realizar check-out",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      color: Colors.greenAccent,
                      onPressed: (){
                        viagens.makeChek_out(widget.viagem);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

