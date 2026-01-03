
import 'package:aplicacion_peliculas/screens/catalogo.dart';
import 'package:aplicacion_peliculas/screens/registro.dart';
import 'package:aplicacion_peliculas/screens/sesion.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NETXI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, 
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
     
      home: const Cuerpo(),
      
      routes: {
        '/login': (context) => const Loginscreen(),
        '/registro': (context) => const Registroscreen(),
        '/catalogo': (context) => const Pantalla3(),
      },
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NETXI",
          style: TextStyle(
            color: Color(0xFFE50914),
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie_creation_outlined, color: Color(0xFFE50914), size: 100),
            const SizedBox(height: 20),
            const Text(
              "Bienvenido a Netxi",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Películas y series ilimitadas y mucho más.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 50),
           
            botones(context),
            const SizedBox(height: 20),
            
          ],
        ),
      ),
    );
  }
}

Widget botones(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE50914), 
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () => Navigator.pushNamed(context, '/login'),
        child: const Text("INICIAR SESIÓN", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 15),
      OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () => Navigator.pushNamed(context, '/registro'),
        child: const Text("REGÍSTRATE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    ],
  );
}
