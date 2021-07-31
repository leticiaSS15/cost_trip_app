import 'package:flutter/material.dart';


class CadastroVeiculoForm extends StatefulWidget {

  final bool edit;

  const CadastroVeiculoForm({Key? key, required this.edit}) : super(key: key);

  @override
  _CadastroVeiculoFormState createState() => _CadastroVeiculoFormState();
}

class _CadastroVeiculoFormState extends State<CadastroVeiculoForm> {

  var controller = new TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 5.0),
                child: TextFormField(
                  enabled: widget.edit,
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      labelText: ('Marca'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: Fiat',
                      icon: Icon(Icons.car_rental)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  enabled: widget.edit,
                  decoration: InputDecoration(
                      labelText: ('Ano'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: 2011',
                      icon: Icon(Icons.calendar_today)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  enabled: widget.edit,
                  decoration: InputDecoration(
                      focusColor: Colors.green,
                      labelText: ('Capacidade do tanque de combustível'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: 23 litros',
                      icon: Icon(Icons.assistant_photo)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  enabled: widget.edit,
                  decoration: InputDecoration(
                      focusColor: Colors.green,
                      labelText: ('Quilômetros por litro'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: 9 km',
                      icon: Icon(Icons.assistant_photo)),
                ),
              ),
              SizedBox(height: 50),
              if (widget.edit) Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Cancelar",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      color: Colors.red,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 10.0, top: 10.0),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Text("Cadastrar",
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
            ],
          ),
        ),
      ),
    );
  }
}

