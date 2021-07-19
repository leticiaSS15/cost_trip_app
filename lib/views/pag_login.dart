import 'package:flutter/material.dart';

class PaginaLogin extends StatefulWidget {
  @override
  _PaginaLoginState createState() => _PaginaLoginState();
}

class _PaginaLoginState extends State<PaginaLogin> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        height: 300.0,
       width: 300.0,
        padding: EdgeInsets.all(16.0),
        child: Form(
          //key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                //onSaved: (value) => _authData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Senha'),
                keyboardType: TextInputType.emailAddress,
                //onSaved: (value) => _authData['email'] = value,
              ),
              Spacer(),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Theme.of(context).primaryColor,
                  //textColor: Theme.of(context).primaryTextTheme.button,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 8.0,
                  ),
                  onPressed: () { },
                  child: Text('ENTRAR'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

