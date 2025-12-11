import 'package:aplicacion_peliculas/sesion.dart';
import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registrarse")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: formularioRegistro(context),
      ),
    );
  }
}

Widget formularioRegistro(context) {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 40),
      Text(
        'Crear cuenta',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: const Color(0xFFE50914),
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 32),
      TextField(
        controller: usernameController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          label: const Text("Nombre de usuario"),
          hintText: "tunombre123",
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
      const SizedBox(height: 16),
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
      const SizedBox(height: 16),
      TextField(
        controller: confirmPasswordController,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          label: const Text("Confirmar contraseña"),
          hintText: "••••••••",
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
      const SizedBox(height: 24),
      ElevatedButton(
        onPressed: ()=>irVentana1(context),
        child: const Text("Crear cuenta"),
      ),
      const SizedBox(height: 16),
      Center(
        
        child: Text(
          '¿Ya tienes cuenta? Inicia sesión',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
 void irVentana1(context){
 Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla1(),));
 }



