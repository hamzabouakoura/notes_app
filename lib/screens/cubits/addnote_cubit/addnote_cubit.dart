import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());

  final _mybox = Hive.box<NoteModel>(kNotesBox);

  void addNote(NoteModel note) async {
    emit(NoteAddLoading());
    try {
      await _mybox.add(note);
      emit(NoteAddSuccess());
    } catch (e) {
      emit(NoteAddFailure());
    }
  }
}
