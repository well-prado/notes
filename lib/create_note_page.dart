import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Note"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                maxLines: null,
                onChanged: (value) {
                  description = value;
                  setState(() {});
                },
              ),
              if (description.isNotEmpty)
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, description);
                    },
                    child: Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
