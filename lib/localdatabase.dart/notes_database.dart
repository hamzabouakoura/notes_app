// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:note_app/models/note_model.dart';

// class NotesDatabase {
//   final _mybox = Hive.box('mybox');

//   List<NoteModel> notesList = [];

//   void initialNote() {
//     notesList = [
//       NoteModel(
//         title: 'Note 1',
//         description: 'description',
//         date: 'Mars 28th 2023',
//       ),
//     ];
//   }

//   void getdata() {
//     notesList = _mybox.get('NOTESLIST');
//   }

//   void updateData() {
//     _mybox.put('NOTESLIST', notesList);
//   }
// }
