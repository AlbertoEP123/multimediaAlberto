import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejer 9 gridView con botones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyGridView(),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView con Botones'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Columnas
        ),
        itemCount: 6, // Total de elementos
        itemBuilder: (BuildContext context, int index) {
          //Genero la lista de filas automáticamente
          if (index < 2) {
            // Para las dos primeras filas, usa el tipo de botón CommonButtom
            return Container(
              color: index.isEven
                  ? Colors.grey[100]
                  : Colors.grey[400], // Color container
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: CommonButton(index: index), // Numero boton
                    ),
                  ],
                ),
              ),
            );
          } else if (index < 4) {
            // Para las filas 2 a la 4, uso el boton flotante de la linterna
            return Container(
              color: index.isEven ? Colors.grey[100] : Colors.grey[400],
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: BotonFlotanteLinterna(),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // Para las otras dos uso el boton switch
            return Container(
              color: index.isEven ? Colors.grey[100] : Colors.grey[400],
              margin: EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      child: SwitchButton(), // Crear instancia aquí
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  final int? index;

  const CommonButton({Key? key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Ink(
          decoration: const ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.android),
            color: Colors.white,
            onPressed: () {
              // Muestro un dialogo
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Alerta'),
                    content: Text(
                        'Botón ${index ?? ''} presionado'), // Contenido de la alerta (numero boton)
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Al presionar se abre
                        },
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class BotonFlotanteLinterna extends StatefulWidget {
  @override
  _BotonFlotanteLinternaState createState() => _BotonFlotanteLinternaState();
}

class _BotonFlotanteLinternaState extends State<BotonFlotanteLinterna> {
  bool _isOn =
      false; // Creo un boolean inicial para saber que no esta presionado

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          _isOn =
              !_isOn; // El set del estado hace lo contrario al boolean es decir true
        });
      },
      child: _isOn
          ? Icon(Icons.flashlight_on)
          : Icon(Icons
              .flashlight_off), // Si no es presionado cambia de icono y viceversa
    );
  }
}

class SwitchApp extends StatelessWidget {
  const SwitchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('Switch Sample')),
        body: const Center(
          child: SwitchButton(),
        ),
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light0 = true;
  bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        ),
        Switch(
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}
