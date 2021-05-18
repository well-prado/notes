import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("NOTES"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1000,
              child: SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: () async {
                var descrption =
                    await Navigator.pushNamed(context, "/create-note");
                setState(
                  () {
                    if (descrption != null) {
                      notes.add(descrption as String);
                    }
                  },
                );
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
