import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ViewViagem extends StatefulWidget {

  final String tela;

  const ViewViagem({Key? key, required this.tela}) : super(key: key);

  @override
  _ViewViagemState createState() => _ViewViagemState();
}

class _ViewViagemState extends State<ViewViagem> {

  var controller = new TextEditingController();
  bool _edicao = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 5.0),
              child: TextFormField(
                enabled: _edicao,
                initialValue: 'ze',
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.location_on)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range_outlined)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.access_time)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.access_time_sharp)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: TextFormField(
                enabled: _edicao,
                initialValue: 'ze',
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.location_on)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: TextFormField(
                enabled: _edicao,
                initialValue: 'ze',
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.location_on)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0, top: 15.0),
              child: TextFormField(
                enabled: _edicao,
                initialValue: '80,00',
                decoration: InputDecoration(
                    focusColor: Colors.black,
                    labelStyle: TextStyle(fontSize: 20),
                    icon: Icon(Icons.money_off_sharp)),
              ),
            ),
            if(widget.tela == 'historico') Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(fontSize: 20),
                          icon: Icon(Icons.date_range)),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: TextFormField(
                      enabled: _edicao,
                      decoration: InputDecoration(
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
                onPressed: (){},
              ),
            ),
            if(widget.tela == 'checkin') Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
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
                      onPressed: (){},
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

