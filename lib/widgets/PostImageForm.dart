import 'package:flutter/material.dart';

class PostImageForm extends StatefulWidget {

  final TextEditingController captionController;
  final TextEditingController tagController;

  PostImageForm({
    this.captionController,
    this.tagController
  });

  @override
  _PostImageFormState createState() => _PostImageFormState();
}

class _PostImageFormState extends State<PostImageForm> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              controller: widget.captionController,
              validator: (value) {
                if (value.isEmpty) return "Please enter some text";

                return null;
              },
              decoration:
                  InputDecoration(labelText: "Caption"),
            ),
            TextFormField(
              controller: widget.tagController,
              validator: (value) {
                if (value.isEmpty) return "Please enter a tag";

                return null;
              },
              decoration: InputDecoration(labelText: "Tag"),
            ),
        ],
      ),
    );
  }
}