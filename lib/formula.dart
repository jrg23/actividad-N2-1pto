import 'package:flutter/material.dart';
import 'home.dart';

bool _checked = false;
bool x = false;

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'formulario';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Miformula(),
      ),
    );
  }
}

class Miformula extends StatefulWidget {
  @override
  MiformulaState createState() {
    return MiformulaState();
  }
}

class MiformulaState extends State<Miformula> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nombre completo:'),
          TextFormField(validator: (value) {
            if (value!.isEmpty) {
              return "introducir la informacion faltante";
            }
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          Text('Correo Electronico:'),
          TextFormField(validator: (value) {
            if (value!.isEmpty) {
              return "introducir la informacion faltante";
            }
          }),
          Text('Senha:'),
          TextFormField(validator: (value) {
            if (value!.isEmpty) {
              return "introducir la informacion faltante";
            }
          }),
          CheckboxListTile(
              title: Text('Acepto los terminos de uso'),
              secondary: Icon(Icons.beach_access),
              controlAffinity: ListTileControlAffinity.leading,
              value: _checked,
              onChanged: (bool? value) {
                setState(() {
                  _checked = value!;
                });
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            // ignore: deprecated_member_use
            child: RaisedButton(
              onPressed: () {
                if (_checked == true) {
                  if (_formKey.currentState!.validate()) {
                    Scaffold.of(context)
                        // ignore: deprecated_member_use
                        .showSnackBar(SnackBar(content: Text('procesado')));
                  }
                } else {
                  Scaffold.of(context)
                      // ignore: deprecated_member_use
                      .showSnackBar(SnackBar(
                          content:
                              Text('ERROR \ Aceptar los terminos de uso')));
                }
              },
              child: Text('enviar'),
            ),
          ),
        ],
      ),
    );
  }
}
