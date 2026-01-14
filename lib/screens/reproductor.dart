import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart'; // Importa Chewie

class Reproductor extends StatefulWidget {
  final String urlVideo;
  final String titulo;

  const Reproductor({super.key, required this.urlVideo, required this.titulo});

  @override
  State<Reproductor> createState() => _ReproductorState();
}

class _ReproductorState extends State<Reproductor> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController; // El controlador de los controles

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    // 1. Inicializamos el controlador del video (tu código base)
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.urlVideo));

    await _videoPlayerController.initialize();

    // 2. Configuramos Chewie con los controles que pediste
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      
      // Personalización de controles
      allowFullScreen: true, // Botón de pantalla completa
      allowPlaybackSpeedChanging: true, // Cambiar velocidad
      showControls: true, // Mostrar barra de tiempo y botones
      
      // Estilo visual
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.red,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.white.withOpacity(0.5),
      ),
      placeholder: Container(color: Colors.black),
      autoInitialize: true,
    );

    setState(() {});
  }

  @override
  void dispose() {
    // Cerramos ambos controladores para evitar fugas de memoria
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.titulo, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? Chewie(controller: _chewieController!) // Renderiza el video con controles
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.red),
                  SizedBox(height: 20),
                  Text("Cargando película...", style: TextStyle(color: Colors.white)),
                ],
              ),
      ),
    );
  }
}