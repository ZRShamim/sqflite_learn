import 'package:flutter/material.dart';
import 'package:sqflite_learn/db/note_db.dart';
import 'package:sqflite_learn/model/note_model.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Note> notes = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshNotes();
  }

  @override
  void dispose() {
    NoteDB.instance.close();
    super.dispose();
  }

  Future<void> refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NoteDB.instance.readAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 1,
      padding: const EdgeInsets.all(15),
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => Container(
        color: Colors.black54,
        child: Column(
          children: [
            Text("notes[index].title"),
          ],
        ),
      ),
    );
  }
}
