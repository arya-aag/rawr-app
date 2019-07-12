import 'package:flutter/material.dart';

import './image_capture.dart';

class PostEditForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostEditFormState();
  }
}

class _PostEditFormState extends State<PostEditForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            TextFormField(
              controller: _titleTextCtrl,
              decoration: InputDecoration(
                icon: Icon(Icons.title),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter title of post';
                }
                return null;
              },
            ),
            SizedBox(
              height: 200.0,
            ),
            Center(
              child: Text('Scroll to bottom!'),
            ),
            RaisedButton(
              child: Text('Create post'),
              onPressed: () {
                Navigator.pushNamed(context, '/capture-image');
              },
            ),
            SizedBox(
              height: 600.0,
            ),
            RaisedButton(
              child: Text('Create post'),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Processing...'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
