import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/components/custom_note.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/cubits/get_data_cubit/get_data_cubit.dart';
import 'package:note_app/screens/edit_note_page.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
    this.note,
  });

  final NoteModel? note;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    BlocProvider.of<GetDataCubit>(context).getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDataCubit, GetDataState>(
      builder: (context, state) {
        if (state is GetDataSuccess) {
          return ListView.builder(
            itemCount: state.notesList.length,
            itemBuilder: (context, index) {
              return CustomNote(
                onTap: () {
                  // navigate to edit note page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return EditNotePage(
                        note: state.notesList[index],
                      );
                    }),
                  );
                },
                note: state.notesList[index],
              );
            },
          );
        } else {
          return const Center(
            child: Text('Add new note'),
          );
        }
      },
    );
  }
}
