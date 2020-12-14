import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> with SingleTickerProviderStateMixin {
  int _selectedCategoryIndex = 0;
  TabController _tabController;
  final DateFormat _dateFormatter = DateFormat('dd MMM');
  final DateFormat _timeFormatter = DateFormat('h:mm');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = index;
          //add animation
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        decoration: BoxDecoration(
          color: _selectedCategoryIndex == index ? Color(0xFF417BFB) : Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            _selectedCategoryIndex == index
                ? BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 10.0)
                : BoxShadow(color: Colors.transparent),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                title,
                style: TextStyle(
                  color: _selectedCategoryIndex == index ? Colors.white : Color(0xFFAFB4C6),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: _selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          AccountBox(),
          SizedBox(height: 20.0),
          Container(
            height: 240.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0)
                  return SizedBox(width: 20.0);
                return _buildCategoryCard(
                  index - 1,
                  categories.keys.toList()[index - 1],
                  categories.values.toList()[index - 1],
                );
              },
            ),
          ),
          HorisontalTabBar(_tabController),
          SizedBox(height: 20.0),
          NotesList(_timeFormatter, _dateFormatter),
        ],
      ),
    );
  }
}

class AccountBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/user.png'),
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          SizedBox(width: 20.0),
          Text(
            'Jenny Breaks',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    );
  }
}

class HorisontalTabBar extends StatelessWidget{

  TabController _tabController;

  HorisontalTabBar(this._tabController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Color(0xFFAFB4C6),
        indicatorColor: Color(0xFF417BFB),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 4.0,
        isScrollable: true,
        tabs: <Widget>[
          Tab(
            child: Text(
              'Notes',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Important',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Tab(
            child: Text(
              'Performed',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class NotesList extends StatelessWidget{

  final DateFormat _timeFormatter, _dateFormatter;

  NotesList(this._timeFormatter, this._dateFormatter);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NoteView(notes[0], _timeFormatter, _dateFormatter),
        SizedBox(height: 20.0),
        NoteView(notes[1], _timeFormatter, _dateFormatter),
      ]);
  }

}