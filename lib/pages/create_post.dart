import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import './../states/tab_state.dart';

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
    Provider.of<TabState>(context).currentIndex = 1;
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
