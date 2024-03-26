part of 'addnote_cubit.dart';

@immutable
abstract class AddnoteState {}

class AddnoteInitial extends AddnoteState {}

class NoteAddLoading extends AddnoteState {}

class NoteAddSuccess extends AddnoteState {}

class NoteAddFailure extends AddnoteState {}
