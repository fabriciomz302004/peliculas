import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtenemos el UID del usuario actual para buscar su info específica
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final DatabaseReference userRef = FirebaseDatabase.instance.ref("usuarios/$uid");

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Mi Perfil"),
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
        stream: userRef.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.red));
          }

          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            // Extraemos los datos
            Map<dynamic, dynamic> datos = snapshot.data!.snapshot.value as Map;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 100, color: Colors.red),
                  const SizedBox(height: 20),
                  _datoUsuario("Nombre", datos['nombre']),
                  _datoUsuario("Edad", datos['edad']),
                  _datoUsuario("Ciudad", datos['ciudad']),
                  _datoUsuario("Correo", datos['correo']),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                    child: const Text("CERRAR SESIÓN", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            );
          } else {
            return const Center(child: Text("No se encontraron datos."));
          }
        },
      ),
    );
  }

  Widget _datoUsuario(String titulo, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(titulo, style: const TextStyle(color: Colors.grey, fontSize: 14)),
          Text(valor, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const Divider(color: Color(0xFF333333), indent: 50, endIndent: 50),
        ],
      ),
    );
  }
}