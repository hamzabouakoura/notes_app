import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/components/custom_textField.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/cubits/get_data_cubit/get_data_cubit.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({
    super.key,
    this.onsave,
    this.isLoading,
    required this.note,
  });

  final VoidCallback? onsave;
  final bool? isLoading;
  final NoteModel note;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  String? title, description;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.note.title;
    _descController.text = widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.description = description ?? widget.note.description;
              widget.note.save();
              BlocProvider.of<GetDataCubit>(context).getdata();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormField(
                controller: _titleController,
                onChanged: (value) {
                  title = value;
                },
                hint: 'Title',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: _descController,
                onChanged: (value) {
                  description = value;
                },
                hint: 'Description',
                maxLines: 5,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
