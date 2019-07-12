import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:camera/camera.dart' as cam;

import './states/tab_state.dart';

import './pages/home.dart';
import './pages/create_post.dart';
import './pages/account_details.dart';

import './widgets/image_capture.dart';

Future<void> main() async {
  final cameras = await cam.availableCameras();
  final firstCamera = cameras.first;
  runApp(RawrApp(firstCamera));
}

class RawrApp extends StatelessWidget {
  final cam.CameraDescription camera;
  final Map<String, Widget Function(BuildContext)> _routes = {
    '/': (context) => HomePage(title: 'Rawr'),
    '/create-post': (context) => CreatePostPage(),
    '/profile': (context) => AccountDetailsPage(),
  };

  RawrApp(this.camera) {
    _routes.addAll({
      '/capture-image': (context) => ImageCapture(camera),
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TabState(),
      child: MaterialApp(
        title: 'Rawr',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        initialRoute: '/',
        routes: _routes,
      ),
    );
  }
}
