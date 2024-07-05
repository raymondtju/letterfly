import 'package:Letterfly/pages/add_letter_page/addletter.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';

class takeAPhotoPage extends StatefulWidget {
  const takeAPhotoPage({super.key});

  @override
  State<takeAPhotoPage> createState() => _takeAPhotoPageState();
}

class _takeAPhotoPageState extends State<takeAPhotoPage> {
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
              prov.addPhoto(image.path);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AddLetterPage(imagePaths: prov.tempPhoto),
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
