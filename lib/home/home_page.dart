import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (var i = 0; i < notes.length; i++)
                Card(
                  child: ListTile(
                    title: Text(notes[i]),
                    onTap: () async {
                      var response = await Navigator.pushNamed(
                          context, "/create-note",
                          arguments: notes[i]);
                      if (response != null) {
                        var description = response as String;
                        if (response.isEmpty) {
                          notes.removeAt(i);
                        } else {
                          notes[i] = description;
                        }
                        setState(() {});
                      }
                    },
                  ),
                ),
              Center(
                child: Container(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          var description = await Navigator.pushNamed(
                              context, "/create-note");
                          setState(() {
                            if (description != null) {
                              notes.add(description as String);
                            }
                          });
                        },
                        child: Text("Adicionar"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
