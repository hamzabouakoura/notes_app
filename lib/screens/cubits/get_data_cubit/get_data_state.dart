part of 'get_data_cubit.dart';

@immutable
abstract class GetDataState {}

class GetDataInitial extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final List<NoteModel> notesList;
  GetDataSuccess(this.notesList);
}

class GetDataFailure extends GetDataState {
  final String? error;
  GetDataFailure({this.error});
}
