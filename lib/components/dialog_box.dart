import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/components/custom_button.dart';
import 'package:note_app/components/custom_textField.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/screens/cubits/addnote_cubit/addnote_cubit.dart';

class DialogBox extends StatelessWidget {
  const DialogBox(
      {super.key,
      required this.titleController,
      this.formKey,
      required this.descController,
      required this.onsave,
      this.isLoading = false,
      this.autovalidateMode});

  final TextEditingController titleController;
  final TextEditingController descController;
  final VoidCallback onsave;
  final bool isLoading;

  final GlobalKey<FormState>? formKey;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new note'),
      content: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomTextFormField(
                hint: 'Title',
                controller: titleController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: descController,
                hint: 'Description',
                maxLines: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 40,
                child: ColorsListView(),
              ),
              const SizedBox(
                height: 15,
              ),
              BlocBuilder<AddnoteCubit, AddnoteState>(
                builder: (context, state) {
                  return CustomButton(
                    isLoading: state is NoteAddLoading ? true : false,
                    text: 'Save',
                    color: Colors.amber.shade300,
                    ontap: onsave,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              setState(() {});
            },
            child: ColorItem(
              color: kColors[index],
              isSelected: currentIndex == index,
            ),
          );
        });
  }
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });

  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: isSelected
          ? CircleAvatar(
              radius: 20,
              backgroundColor: color,
              child: const Icon(
                Icons.done,
                color: Colors.white,
              ),
            )
          : CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
    );
  }
}
