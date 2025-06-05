import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController telefonoController = TextEditingController(text: "");
  TextEditingController direccionController = TextEditingController(text: "");
  TextEditingController apellidoPaternoController = TextEditingController(text: "");
  TextEditingController apellidoMaternoController = TextEditingController(text: "");
  TextEditingController cuentaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Agregar el nombre'),
            ),
            TextField(
              controller: telefonoController,
              decoration: const InputDecoration(hintText: 'Agregar el telefono'),
            ),
            TextField(
              controller: direccionController,
              decoration: const InputDecoration(hintText: 'Agregar la direccion'),
            ),
            TextField(
              controller: apellidoPaternoController,
              decoration: const InputDecoration(hintText: 'Agregar el apellido paterno'),
            ),
            TextField(
              controller: apellidoMaternoController,
              decoration: const InputDecoration(hintText: 'Agregar el apellido materno'),
            ),
            TextField(
              controller: cuentaController,
              decoration: const InputDecoration(hintText: 'Agregar la cuenta'),
            ),
            ElevatedButton(
              onPressed: () async {
                await addCliente(
                    nameController.text,
                    telefonoController.text,
                    direccionController.text,
                    apellidoMaternoController.text,
                    apellidoPaternoController.text,
                    cuentaController.text,
                  ).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}
