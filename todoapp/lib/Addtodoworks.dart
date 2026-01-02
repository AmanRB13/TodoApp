import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/providers.dart';
import 'Widgets/widgets.dart';

class Addtodowork extends StatefulWidget {
  const Addtodowork({super.key});

  @override
  State<Addtodowork> createState() => _AddtodoworkState();
}

class _AddtodoworkState extends State<Addtodowork> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Listprovider>(
      builder:
          (context, model, child) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Todolist(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          model.savelist();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Your todo works are saved'),
                            ),
                          );
                        }
                      },
                      child: Text('Save your work'),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
