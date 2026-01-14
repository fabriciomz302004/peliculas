import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aplicacion_peliculas/screens/reproductor.dart'; 
import 'package:aplicacion_peliculas/screens/perfil.dart'; 
// Importamos la nueva pantalla que crearemos abajo
import 'package:aplicacion_peliculas/screens/trailer_screen.dart'; 

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("NETXI", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PerfilScreen())),
          ),
        ],
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/data/peliculas3.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> data = json.decode(snapshot.data.toString());
            final List peliculas = data['peliculas'];

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: peliculas.length,
              itemBuilder: (context, index) => _buildMoviePoster(context, peliculas[index]),
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }

  Widget _buildMoviePoster(BuildContext context, dynamic item) {
    return GestureDetector(
      onTap: () => _mostrarDetalles(context, item),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(item['imagen'], fit: BoxFit.cover),
      ),
    );
  }

  void _mostrarDetalles(BuildContext context, dynamic item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1C1C),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(item['titulo'], style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(item['descripcion'], 
                style: const TextStyle(color: Colors.white70), 
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 25),
            
            // BOTÓN VER PELÍCULA
            _botonPersonalizado("VER AHORA", Colors.red, () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => Reproductor(urlVideo: item['video'], titulo: item['titulo'])
              ));
            }),

            const SizedBox(height: 12),

            // BOTÓN VER TRÁILER - Esta es la clave para que no se congele
            _botonBorde("VER TRÁILER", () {
              Navigator.pop(context); // Cierra el modal para liberar memoria
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => TrailerScreen(
                  youtubeId: item['youtube_id'] ?? "dQw4w9WgXcQ",
                  titulo: item['titulo'],
                )
              ));
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _botonPersonalizado(String texto, Color color, VoidCallback accion) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, 
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        onPressed: accion,
        child: Text(texto, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _botonBorde(String texto, VoidCallback accion) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Colors.white), 
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
        ),
        onPressed: accion,
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}