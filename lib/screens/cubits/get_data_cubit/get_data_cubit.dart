import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/models/note_model.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  final _mybox = Hive.box<NoteModel>(kNotesBox);
  GetDataCubit() : super(GetDataInitial());

  void getdata() {
    List<NoteModel> noteslist = _mybox.values.toList();
    emit(GetDataSuccess(noteslist));
  }

  // void updateData() {
  //   _mybox.put('NOTESLIST', notesList);
  // }
}
