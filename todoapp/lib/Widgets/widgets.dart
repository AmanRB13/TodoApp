import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Providers/providers.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Listprovider>(
      builder:
          (context, model, child) => Card(
            child: Column(
              children: [
                for (int i = 0; i < model.worktitle.length; i++)
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            model.removeworktitle(i);
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter the work you want to do',
                            ),
                            initialValue: model.worktitle[i],
                            maxLength: 100,
                            maxLines: 2,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter the work you want to do';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              model.worktitle[i] = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    model.addlist();
                  },
                  child: const Text('Add works'),
                ),
              ],
            ),
          ),
    );
  }
}
