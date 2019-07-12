import 'dart:io';

import 'package:flutter/material.dart';

import 'package:camera/camera.dart' as cam;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as pp;

class ImageCapture extends StatefulWidget {
  final cam.CameraDescription camera;
  // final Function setImage;

  ImageCapture(this.camera);
  // ImageCapture(this.setImage);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  cam.CameraController _camController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _camController = cam.CameraController(widget.camera, cam.ResolutionPreset.medium);
    _initializeControllerFuture = _camController.initialize();
  }

  @override
  void dispose() {
    _camController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return cam.CameraPreview(_camController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final path = p.join(
              (await pp.getTemporaryDirectory()).path,
              'IMG_${DateTime.now()}.jpg',
            );

            await _camController.takePicture(path);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(imagePath: path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}
