import 'package:cost_trip/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VisualizarViagem extends StatefulWidget {

  @override
  _VisualizarViagemState createState() => _VisualizarViagemState();
}

class _VisualizarViagemState extends State<VisualizarViagem> {

  var controller = new TextEditingController();
  bool _edicao = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
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
              padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 70.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Meus veículos",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                color: Colors.greenAccent,
                onPressed: (){
                  Navigator.pushNamed(context, '/pagVeiculoCadastrado');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

