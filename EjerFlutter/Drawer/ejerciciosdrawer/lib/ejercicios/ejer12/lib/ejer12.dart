import 'package:flutter/material.dart';

void main() {
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina el Número',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        hintColor: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AdivinaNumeroFormulario(),
    );
  }
}

class AdivinaNumeroFormulario extends StatefulWidget {
  @override
  _AdivinaNumeroFormularioState createState() =>
      _AdivinaNumeroFormularioState();
}

class _AdivinaNumeroFormularioState extends State<AdivinaNumeroFormulario> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controladorNumero = TextEditingController();
  int _numeroSecreto = 0;
  String _mensaje = '';

  @override
  void initState() {
    super.initState();
    _generarNumeroSecreto();
  }

  void _generarNumeroSecreto() {
    _numeroSecreto = 1 + DateTime.now().microsecondsSinceEpoch % 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Número'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _controladorNumero,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Introduce un número del 1 al 100',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, introduce un número';
                  }
                  int? numero = int.tryParse(value);
                  if (numero == null || numero < 1 || numero > 100) {
                    return 'Introduce un número válido del 1 al 100';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int numeroAdivinado = int.parse(_controladorNumero.text);
                    if (numeroAdivinado < _numeroSecreto) {
                      setState(() {
                        _mensaje = 'El número es mayor';
                      });
                    } else if (numeroAdivinado > _numeroSecreto) {
                      setState(() {
                        _mensaje = 'El número es menor';
                      });
                    } else {
                      setState(() {
                        _mensaje =
                            '¡Felicidades! Has adivinado el número $_numeroSecreto';
                      });
                      _generarNumeroSecreto();
                      _controladorNumero.clear();
                    }
                  }
                },
                child: Text('Comprobar'),
              ),
              SizedBox(height: 16),
              Text(
                _mensaje,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controladorNumero.dispose();
    super.dispose();
  }
}
