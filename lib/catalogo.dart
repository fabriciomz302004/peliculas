import 'package:aplicacion_peliculas/reproductor.dart';
import 'package:flutter/material.dart';

class Movie {
  final String titulo;
  final String imagenUrl;
  final String descripcion;
  final String duracion;
  final double calificacion;

  Movie({
    required this.titulo,
    required this.imagenUrl,
    required this.descripcion,
    required this.duracion,
    required this.calificacion,
  });
}

class Pantalla3 extends StatelessWidget {
  const Pantalla3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catálogo de Películas"),
        elevation: 0,
      ),
      body: CatalogoBody(),
    );
  }
}

class CatalogoBody extends StatelessWidget {
  final List<Movie> peliculas = [
    Movie(
      titulo: 'Interestelar',
      imagenUrl: 'https://images.unsplash.com/photo-1533613220915-609f71a97b12?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un viaje épico a través del espacio en busca de la supervivencia humana.',
      duracion: '169 min',
      calificacion: 8.6,
    ),
    Movie(
      titulo: 'Inception',
      imagenUrl: 'https://images.unsplash.com/photo-1489599849228-bed96c3f3afa?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un ladrón que roba secretos corporativos en el mundo de los sueños.',
      duracion: '148 min',
      calificacion: 8.8,
    ),
    Movie(
      titulo: 'The Dark Knight',
      imagenUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Batman enfrenta a su mayor enemigo, el Joker.',
      duracion: '152 min',
      calificacion: 9.0,
    ),
    Movie(
      titulo: 'Pulp Fiction',
      imagenUrl: 'https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Historias entrelazadas de crimen, amor y redención.',
      duracion: '154 min',
      calificacion: 8.9,
    ),
    Movie(
      titulo: 'Forrest Gump',
      imagenUrl: 'https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'La vida extraordinaria de un hombre extraordinario.',
      duracion: '142 min',
      calificacion: 8.8,
    ),
    Movie(
      titulo: 'Matrix',
      imagenUrl: 'https://images.unsplash.com/photo-1486572788984-e12dcb96b773?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un hacker descubre la verdadera naturaleza de su realidad.',
      duracion: '136 min',
      calificacion: 8.7,
    ),
    Movie(
      titulo: 'Parasite',
      imagenUrl: 'https://images.unsplash.com/photo-1545666977-b85b1c14da23?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Una familia pobre planea un ingenioso esquema de infiltración.',
      duracion: '132 min',
      calificacion: 8.6,
    ),
    Movie(
      titulo: 'The Shawshank Redemption',
      imagenUrl: 'https://images.unsplash.com/photo-1517604931442-7f3b6e9b6b0e?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'La historia de amistad y esperanza en una prisión.',
      duracion: '142 min',
      calificacion: 9.3,
    ),
    Movie(
      titulo: 'Gladiator',
      imagenUrl: 'https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un general se convierte en esclavo y lucha por su libertad.',
      duracion: '155 min',
      calificacion: 8.5,
    ),
    Movie(
      titulo: 'Avatar',
      imagenUrl: 'https://images.unsplash.com/photo-1533613220915-609f71a97b12?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un hombre se une a los Na\'vi en un mundo alienígena.',
      duracion: '162 min',
      calificacion: 7.8,
    ),
    Movie(
      titulo: 'Titanic',
      imagenUrl: 'https://images.unsplash.com/photo-1489599849228-bed96c3f3afa?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un romance épico en el hundimiento del Titanic.',
      duracion: '194 min',
      calificacion: 7.8,
    ),
    Movie(
      titulo: 'Jaws',
      imagenUrl: 'https://images.unsplash.com/photo-1509042239860-f550ce710b93?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un tiburón gigante aterroriza una playa costera.',
      duracion: '124 min',
      calificacion: 8.0,
    ),
    Movie(
      titulo: 'Jurassic Park',
      imagenUrl: 'https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Dinosaurios revividos crean caos en un parque temático.',
      duracion: '127 min',
      calificacion: 8.1,
    ),
    Movie(
      titulo: 'The Lion King',
      imagenUrl: 'https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Un león joven reclama su trono en las tierras africanas.',
      duracion: '88 min',
      calificacion: 8.5,
    ),
    Movie(
      titulo: 'Frozen',
      imagenUrl: 'https://images.unsplash.com/photo-1486572788984-e12dcb96b773?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Dos hermanas mágicas luchan por salvar un reino congelado.',
      duracion: '102 min',
      calificacion: 7.4,
    ),
    Movie(
      titulo: 'The Avengers',
      imagenUrl: 'https://images.unsplash.com/photo-1545666977-b85b1c14da23?q=80&w=500&auto=format&fit=crop&ixlib=rb-4.0.3',
      descripcion: 'Superhéroes se unen para salvar el mundo.',
      duracion: '143 min',
      calificacion: 8.0,
    ),
  ];

  CatalogoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSeccionPeliculas('Populares', peliculas.sublist(0, 6)),
            const SizedBox(height: 24),
            _buildSeccionPeliculas('Tendencias', peliculas.sublist(6, 12)),
            const SizedBox(height: 24),
            _buildSeccionPeliculas('Nuevas Llegadas', peliculas.sublist(12)),
          ],
        ),
      ),
    );
  }

  Widget _buildSeccionPeliculas(String titulo, List<Movie> listaPeliculas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 12),
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listaPeliculas.length,
            itemBuilder: (context, index) {
              final pelicula = listaPeliculas[index];
              return _buildPeliculaCard(pelicula, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPeliculaCard(Movie pelicula, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          _mostrarDetalles(pelicula, context);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                pelicula.imagenUrl,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 200,
                    color: Colors.grey[800],
                    child: const Icon(Icons.movie, color: Colors.grey),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 150,
              child: Text(
                pelicula.titulo,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarDetalles(Movie pelicula, BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: const Color(0xFF221F1F),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                pelicula.titulo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.star, color: const Color(0xFFE50914)),
                  const SizedBox(width: 4),
                  Text(
                    pelicula.calificacion.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.schedule, color: const Color(0xFFE50914)),
                  const SizedBox(width: 4),
                  Text(
                    pelicula.duracion,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                pelicula.descripcion,
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:()=>irVentana4(context),
                  
                  child: const Text('Reproducir'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
void irVentana4(context){
 Navigator.push(context, MaterialPageRoute(builder: (context)=> Pantalla4(),));
 }