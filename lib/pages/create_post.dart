import 'package:flutter/material.dart';

class CreatePost extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePostState();
  }
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Center(
        child: Text('You can create a post here!'),
      ),
    );
  }
}
