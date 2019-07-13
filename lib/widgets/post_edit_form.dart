import 'dart:io';

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
  File _imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            ImageCapture((value) {
              print(value);
            }),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: _titleTextCtrl,
              decoration: InputDecoration(
                labelText: 'Write a caption...',
              ),
              minLines: 3,
              maxLines: 5,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a caption.';
                }
                return null;
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Publish!'),
              color: Theme.of(context).primaryColorLight,
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
