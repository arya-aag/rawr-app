import 'package:flutter/material.dart';

import './../widgets/post_edit_form.dart';
// import './../widgets/bottom_navbar.dart';

class CreatePostPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreatePostPageState();
  }
}

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: PostEditForm(),
      // bottomNavigationBar: BottomNavbar(),
    );
  }
}
