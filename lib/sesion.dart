import 'package:aplicacion_peliculas/catalogo.dart';
import 'package:flutter/material.dart';

class Pantalla1 extends StatelessWidget {
  const Pantalla1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar sesión")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: formularioLogin(context),
      ),
    );
  }
}

Widget formularioLogin(context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 40),
      Text(
        'Bienvenido',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: const Color(0xFFE50914),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 32),
      TextField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          label: const Text("Correo electrónico"),
          hintText: "tu@email.com",
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
      const SizedBox(height: 16),
      TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          label: const Text("Contraseña"),
          hintText: "••••••••",
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
      const SizedBox(height: 24),
      ElevatedButton(
        onPressed: ()=>irVentana3(context),
        child: const Text("Iniciar sesión"),
      ),
      const SizedBox(height: 16),
      Center(
        child: Text(
          '¿No tienes cuenta? Registrate',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
 void irVentana3(context){
 Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla3(),));
 }


