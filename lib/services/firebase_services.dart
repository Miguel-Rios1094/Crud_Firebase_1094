import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getCliente() async {
  List cliente = [];
  CollectionReference collectionReferenceCliente = db.collection("cliente");
  QuerySnapshot queryCliente = await collectionReferenceCliente.get();
  for (var doc in queryCliente.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "nombre": data["nombre"],
      "telefono": data["telefono"],
      "direccion": data["direccion"],
      "apellidom": data["apellidom"],
      "apellidop": data["apellidop"],
      "cuenta": data["cuenta"],
      "uid": doc.id,
    };
    cliente.add(person);
  }
  return cliente;
}

Future<void> addCliente(
  String nombre,
  String telefono,
  String direccion,
  String apellidom,
  String apellidop,
  String cuenta,
) async {
  await db.collection("cliente").add({"nombre": nombre, "telefono": telefono, "direccion": direccion, "apellidom": apellidom, "apellidop": apellidop, "cuenta": cuenta});
}

Future<void> updateCliente(
  String uid,
  String nombre,
  String telefono,
  String direccion,
  String apellidom,
  String apellidop,
  String cuenta,
  ) async {
  await db.collection("cliente").doc(uid).set({"nombre": nombre, "telefono": telefono, "direccion": direccion, "apellidom": apellidom, "apellidop": apellidop, "cuenta": cuenta});
}

Future<void> deleteCliente(String uid) async {
  await db.collection("cliente").doc(uid).delete();
}
