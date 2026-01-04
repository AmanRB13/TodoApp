import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Providers/providers.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Notes'), centerTitle: true),
      body: Consumer<Listprovider>(
        builder: (context, model, child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Enter the title',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 28),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the title';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      model.addnotestitle(value!);
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: notesController,
                    decoration: const InputDecoration(
                      hintText: 'Enter the notes',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 28),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the notes';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      model.addnotesbody(value!);
                    },
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          model.savenotes();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Notes Saved')),
                          );
                        }
                      },

                      child: const Text('Save your notes'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
