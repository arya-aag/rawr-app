import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  final Function setImage;

  ImageCapture(this.setImage);

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  File _imageFile;

  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source).then(
      (File imgFile) {
        setState(() {
          _imageFile = imgFile;
        });
        widget.setImage(imgFile);
      },
    );
  }

  void _openImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          padding: EdgeInsets.all(10.0),
          child: Column(children: [
            Text(
              'Pick an Image',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Use Camera'),
              onPressed: () {
                _getImage(context, ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Use Gallery'),
              onPressed: () {
                _getImage(context, ImageSource.gallery);
                Navigator.pop(context);
              },
            )
          ]),
        );
      },
    );
  }

  Widget _buildPreviewImage(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    Widget previewImage = Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Image.file(
          _imageFile,
          fit: BoxFit.cover,
          width: availableWidth,
          height: availableWidth - 100.0,
          alignment: Alignment.center,
        ),
        Positioned(
          top: 10.0,
          right: -10.0,
          child: MaterialButton(
            onPressed: () => _openImagePicker(context),
            child: Icon(
              Icons.edit,
              color: Colors.white54,
              size: 20.0,
            ),
            color: Color.fromARGB(50, 0, 0, 0),
            shape: CircleBorder(),
            elevation: 0.0,
            padding: const EdgeInsets.all(5.0),
          ),
        ),
      ],
    );

    return previewImage;
  }

  Widget _buildAddImageBox(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;
    Widget addImageBox = Container(
      width: availableWidth,
      height: availableWidth - 100.0,
      child: Center(
        child: RaisedButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                size: 16.0,
              ),
              SizedBox(width: 4.0),
              Text('Add image'),
            ],
          ),
          color: Colors.white,
          onPressed: () {
            _openImagePicker(context);
          },
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: LinearGradient(
            colors: [Color.fromARGB(20, 0, 0, 0), Color.fromARGB(40, 0, 0, 0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
    );
    return addImageBox;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _imageFile != null ? _buildPreviewImage(context) : _buildAddImageBox(context),
      ],
    );
  }
}
