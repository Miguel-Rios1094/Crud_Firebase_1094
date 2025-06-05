import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController direccionController = TextEditingController(text: "");
  TextEditingController apellidoPaternoController = TextEditingController(text: "");
  TextEditingController apellidoMaternoController = TextEditingController(text: "");
  TextEditingController cuentaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['nombre'];
    telefonoController.text = arguments['telefono'];
    direccionController.text = arguments['direccion'];
    apellidoPaternoController.text = arguments['apellidop'];
    apellidoMaternoController.text = arguments['apellidom'];
    cuentaController.text = arguments['cuenta'];
    return Scaffold(
      appBar: AppBar(title: const Text('Editar Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Modificar nombre'),
            ),
            TextField(
              controller: telefonoController,
              decoration: const InputDecoration(hintText: 'Modificar telefono'),
            ),
            TextField(
              controller: direccionController,
              decoration: const InputDecoration(hintText: 'Modificar direccion'),
            ),
            TextField(
              controller: apellidoMaternoController,
              decoration: const InputDecoration(hintText: 'Modificar apellido materno'),
            ),
            TextField(
              controller: apellidoPaternoController,
              decoration: const InputDecoration(hintText: 'Modificar apellido paterno'),
            ),
            TextField(
              controller: cuentaController,
              decoration: const InputDecoration(hintText: 'Modificar cuenta'),
            ),
            ElevatedButton(
              onPressed: () async {
                await updateCliente(arguments["uid"],
                 nameController.text,
                 telefonoController.text,
                 direccionController.text,
                 apellidoMaternoController.text,
                 apellidoPaternoController.text,
                 cuentaController.text,
                 )
                .then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}
