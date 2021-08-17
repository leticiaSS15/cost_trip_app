import 'package:flutter/material.dart';


class UsuarioForm extends StatefulWidget {

  @override
  _UsuarioFormState createState() => _UsuarioFormState();
}

class _UsuarioFormState extends State<UsuarioForm> {

  DateTime now = new DateTime.now();
  DateTime date = DateTime.now();
  //var dateFormat = DateFormat('dd/MM/y');
  //String _tipoSaida;
  var controller = new TextEditingController();
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  bool _permissao_cadastro = false;


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
                  enabled: _permissao_cadastro,
                  //initialValue: 'ze',
                  decoration: InputDecoration(
                    focusColor: Colors.black,
                      labelText: ('Nome de usuário'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: Pafuncio_15',
                      icon: Icon(Icons.perm_identity)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  enabled: _permissao_cadastro,
                  decoration: InputDecoration(
                      labelText: ('E-mail'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: pafuncio@gmail.com',
                      icon: Icon(Icons.email)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  enabled: _permissao_cadastro,
                  decoration: InputDecoration(
                    focusColor: Colors.green,
                      labelText: ('Idade'),
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: 'Ex: 23 anos',
                      icon: Icon(Icons.plus_one)),
                ),
              ),
              SizedBox(height: 15.0),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){
                      setState(() {
                        _permissao_cadastro = true;
                      });
                      },
                    child: Text('Atualizar dados', style: TextStyle(color: Colors.black),)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

