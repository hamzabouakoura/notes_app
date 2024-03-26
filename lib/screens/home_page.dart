import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/components/dialog_box.dart';
import 'package:note_app/components/home_page_body.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/helper/snack_bar.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/cubits/addnote_cubit/addnote_cubit.dart';
import 'package:note_app/screens/cubits/get_data_cubit/get_data_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final titleController = TextEditingController();

  final descController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddnoteCubit(),
                  child: BlocConsumer<AddnoteCubit, AddnoteState>(
                    listener: (context, state) {
                      if (state is NoteAddSuccess) {
                        BlocProvider.of<GetDataCubit>(context).getdata();

                        Navigator.pop(context);

                        showSnackBar(context, 'Note added succesfuly');
                        titleController.clear();
                        descController.clear();
                      }
                    },
                    builder: (context, state) {
                      return AbsorbPointer(
                        absorbing: state is NoteAddLoading ? true : false,
                        child: DialogBox(
                          formKey: formKey,
                          titleController: titleController,
                          descController: descController,
                          autovalidateMode: autovalidateMode,
                          onsave: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var noteModel = NoteModel(
                                color: int.parse(kColors.first.toString()),
                                title: titleController.text,
                                description: descController.text,
                                date:
                                    DateTime.now().toString().substring(0, 10),
                              );
                              BlocProvider.of<AddnoteCubit>(context)
                                  .addNote(noteModel);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        ),
                      );
                    },
                  ),
                );
              });
        },
        backgroundColor: Colors.amber[300],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Notes',
        ),
      ),
      body: const HomePageBody(),
    );
  }
}
