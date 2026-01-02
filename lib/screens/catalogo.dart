import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aplicacion_peliculas/screens/reproductor.dart';

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "NETXI",
          style: TextStyle(
            color: Color(0xFFE50914), 
            fontWeight: FontWeight.bold,
            letterSpacing: 2
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: rootBundle.loadString('assets/data/peliculas3.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> data = json.decode(snapshot.data.toString());
            final List peliculas = data['peliculas'];

            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // CAMBIO: Ahora 3 columnas para que sean más pequeñas
                childAspectRatio: 0.65, // Ajuste de proporción para pósters más estilizados
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: peliculas.length,
              itemBuilder: (context, index) {
                final item = peliculas[index];
                return _buildMovieCard(context, item);
              },
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }

  Widget _buildMovieCard(BuildContext context, dynamic item) {
    return GestureDetector(
      onTap: () => _mostrarDetalles(context, item),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4), // Bordes menos redondeados, más tipo Netflix
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(item['imagen']),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _mostrarDetalles(BuildContext context, dynamic item) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2B2B2B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item['titulo'],
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              item['descripcion'],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE50914),
                  padding: const EdgeInsets.symmetric(vertical: 12)
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Pantalla4()),
                  );
                },
                child: const Text("VER AHORA"),
              ),
            )
          ],
        ),
      ),
    );
  }
}