import 'package:flutter/material.dart';

class PostEditForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostEditFormState();
  }
}

class _PostEditFormState extends State<PostEditForm> {
  final _formKey = GlobalKey<FormState>();
  // final _titleTextCtrl = TextEditingController()

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
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
            height: 10.0,
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
    );
  }
}
