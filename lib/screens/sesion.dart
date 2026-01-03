
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aplicacion_peliculas/screens/catalogo.dart'; 

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: const Text("Iniciar Sesión"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: formulario(context),
      ),
    );
  }
}

Widget formulario(context) {
  TextEditingController _correo = TextEditingController();
  TextEditingController _contrasenia = TextEditingController();

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
   
      TextField(
        controller: _correo, 
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Correo Electrónico",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF333333), 
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 16),
      // Campo de Contraseña
      TextField(
        controller: _contrasenia, 
        obscureText: true, 
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: "Contraseña",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: const Color(0xFF333333),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      const SizedBox(height: 30),
   
      SizedBox(
        width: double.infinity,
        height: 50,
        child: FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFFE50914), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => login(_correo, _contrasenia, context), 
          child: const Text(
            "Iniciar Sesión",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          )
        ),
      )
    ],
  );
}

Future<void> login(correo, contrasenia, context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo.text, 
        password: contrasenia.text
    );
    
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const Pantalla3())
    );

  } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF333333),
        title: const Text("Error", style: TextStyle(color: Colors.white)),
        content: Text(e.code, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text("OK", style: TextStyle(color: Color(0xFFE50914)))
          )
        ],
      ),
    );
  }
}