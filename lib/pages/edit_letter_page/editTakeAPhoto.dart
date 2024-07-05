import 'package:Letterfly/pages/edit_letter_page/editLetter.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

class EditTakeAPhotoPage extends StatefulWidget {
  final int id_letter;

  const EditTakeAPhotoPage({super.key, required this.id_letter});

  @override
  State<EditTakeAPhotoPage> createState() => _EditTakeAPhotoPageState();
}

class _EditTakeAPhotoPageState extends State<EditTakeAPhotoPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print("No cameras available");
      return;
    }
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize().catchError((error) {
      print("Error initializing camera: $error");
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    final itemOfLetter =
        prov.Letters.firstWhere((letter) => letter.id == widget.id_letter);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FutureBuilder<void>(
          future: _initializeControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_controller.value.isInitialized) {
            try {
              final image = await _controller.takePicture();
              itemOfLetter.imagePaths.add(
                image.path,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditLetterPage(
                    id_letter: widget.id_letter,
                  ),
                ),
              );
            } catch (e) {
              print(e);
            }
          } else {
            print("Camera is not initialized");
          }
        },
        child: const Icon(Icons.camera),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
