import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart'; // Importante para Realtime DB
import 'package:aplicacion_peliculas/screens/sesion.dart'; 

class Registroscreen extends StatelessWidget {
  const Registroscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: const Text("Crear Cuenta", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: formulario(context),
        ),
      ),
    );
  }
}

Widget formulario(BuildContext context) {
  // Usamos nombres cortos para los controladores como en tu ejemplo
  final TextEditingController n = TextEditingController(); // nombre
  final TextEditingController e = TextEditingController(); // edad
  final TextEditingController c = TextEditingController(); // ciudad
  final TextEditingController mail = TextEditingController(); // correo
  final TextEditingController pass = TextEditingController(); // contrasenia

  return Column(
    children: [
      _campo("Nombre Completo", n, Icons.person),
      _campo("Edad", e, Icons.cake, teclado: TextInputType.number),
      _campo("Ciudad", c, Icons.location_city),
      _campo("Correo Electrónico", mail, Icons.email, teclado: TextInputType.emailAddress),
      _campo("Contraseña", pass, Icons.lock, ocultar: true),
      
      const SizedBox(height: 30),
      
      SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          style: FilledButton.styleFrom(backgroundColor: const Color(0xFFE50914)),
          onPressed: () {
            // Validamos que no envíe campos vacíos
            if(n.text.isEmpty || mail.text.isEmpty || pass.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Por favor, llena todos los campos"))
              );
              return;
            }
            // Llamamos a la función registro
            registro(n.text, e.text, c.text, mail.text, pass.text, context);
          },
          child: const Text("REGISTRARSE", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      )
    ],
  );
}

// Widget auxiliar para los campos de texto
Widget _campo(String label, TextEditingController controller, IconData icono, {bool ocultar = false, TextInputType teclado = TextInputType.text}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: TextField(
      controller: controller,
      obscureText: ocultar,
      keyboardType: teclado,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icono, color: Colors.grey),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF333333),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
      ),
    ),
  );
}

Future<void> registro(String nombre, String edad, String ciudad, String correo, String contrasenia, BuildContext context) async {
  try {
    // 1. Crear el usuario en Firebase Authentication
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: correo.trim(),
      password: contrasenia.trim(),
    );

    // 2. Guardar datos en Realtime Database (usando la lógica que ya te funciona)
    // Ruta: usuarios / UID_DEL_USUARIO
    DatabaseReference baseDeDatos = FirebaseDatabase.instance.ref("usuarios/${userCredential.user!.uid}");
    
    await baseDeDatos.set({
      "nombre": nombre,
      "edad": edad,
      "ciudad": ciudad,
      "correo": correo,
      "uid": userCredential.user!.uid,
      "fecha_registro": DateTime.now().toString()
    });

    // 3. Redirigir al Login
    if (context.mounted) {
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const Loginscreen())
      );
    }

  } on FirebaseAuthException catch (err) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${err.message}")));
  } catch (err) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error inesperado: $err")));
  }
}