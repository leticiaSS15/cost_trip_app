import 'package:cost_trip/widgets/app_bar.dart';
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

/*
  Future<void> _selectDate(BuildContext context) async {
    await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        date = pickedDate;
        _formData['data'] = DateFormat('dd/MM/y').format(pickedDate);
      });
    });
  } */

 /* void salvar(){

    var isValid = _form.currentState.validate();
    if(!isValid){
      return;
    }
    _form.currentState.save();
    _servicoSaida.salvarSaida(_formData);
  }  */

/*  void dialogConfirmarSalvar(){
    showDialog(context: context,
        builder: (_) => AlertDialog(
          title: Text('Registro salvo com sucesso!'),
          content: Text('Deseja efetuar mais registros?'),
          actions: [
            FlatButton(
              child: Text('Não'),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            FlatButton(
                child: Text('Sim'),
                onPressed: (){
                  Navigator.pop(context);
                  _form.currentState.reset();
                }
            ),
          ],
        )
    );
  } */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                        decoration: InputDecoration(
                            labelText: ('Nome ou breve descrição do gasto'),
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Ex: Pagamento da escola da Maria',
                        ),
                      ),
                    TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            labelText: ('Valor do gasto'),
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Ex: 150.00',
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                  ],
                ),
          ),
        ),
    );
  }
}

