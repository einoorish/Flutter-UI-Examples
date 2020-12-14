import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Note {
  String title;
  String content;
  DateTime date;

  Note({this.title, this.content, this.date});
}

class NoteView extends StatelessWidget{

  final Note _note;

  final DateFormat _timeFormatter, _dateFormatter;

  NoteView(this._note, this._timeFormatter, this._dateFormatter);

  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.symmetric(horizontal: 30.0),
     padding: EdgeInsets.all(30.0),
     decoration: BoxDecoration(
       color: Color(0xFFF5F7FB),
       borderRadius: BorderRadius.circular(30.0),
     ),
     child: Column(
       children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text(
               _note.title,
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 18.0,
                 fontWeight: FontWeight.w600,
               ),
             ),
             Text(
               _timeFormatter.format(_note.date),
               style: TextStyle(
                 color: Color(0xFFAFB4C6),
                 fontSize: 18.0,
                 fontWeight: FontWeight.w500,
               ),
             ),
           ],
         ),
         SizedBox(height: 15.0),
         Text(
           _note.content,
           style: TextStyle(
             color: Colors.black,
             fontSize: 14.0,
             fontWeight: FontWeight.w500,
           ),
           maxLines: 2,
           overflow: TextOverflow.ellipsis,
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.end,
           children: <Widget>[
             Text(
               _dateFormatter.format(_note.date),
               style: TextStyle(
                 color: Color(0xFFAFB4C6),
                 fontSize: 18.0,
                 fontWeight: FontWeight.w500,
               ),
             ),
             Container(
               height: 50.0,
               width: 50.0,
               decoration: BoxDecoration(
                 color: Color(0xFF417BFB),
                 borderRadius: BorderRadius.circular(15.0),
               ),
               child: Icon(
                 Icons.location_on,
                 color: Colors.white,
               ),
             ),
           ],
         ),
       ],
     ),
   );
  }

}

//-----------------------------------------------------------------------------

final Map<String, int> categories = {
  'Notes': 112,
  'Work': 58,
  'Home': 23,
  'Archive': 31,
};

final List<Note> notes = [
  Note(
    title: 'Buy ticket',
    content: 'Buy airplane ticket through Kayak for \$318.38',
    date: DateTime(2019, 10, 10, 8, 30),
  ),
  Note(
    title: 'Walk with dog',
    content: 'Walk on the street with my favorite dog.',
    date: DateTime(2019, 10, 10, 8, 30),
  ),
];