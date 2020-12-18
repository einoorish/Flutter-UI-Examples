
import 'package:chat/models/data_pump.dart';
import 'package:chat/models/message.dart';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), iconSize: 30.0, color: Colors.white, onPressed: () {},),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            _MessagesList(),
            _MessageComposer()
          ],
        ),
      ),
    );
  }
}

class _MessageWidget extends StatelessWidget{

  Message message;
  bool isCurrentUser;

  _MessageWidget(this.message){
    isCurrentUser = message.sender.id == currentUser.id;
  }

  @override
  Widget build(BuildContext context) {
    final Container messageBox = Container(
        margin: isCurrentUser
            ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
            : EdgeInsets.only(top: 8.0, bottom: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          color: isCurrentUser ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isCurrentUser
              ? BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              : BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.time, style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(message.text, style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w600))
          ],
        )
    );

    if(isCurrentUser) return messageBox;
    else return Row(
      children: [
        messageBox,
        IconButton(
          icon: message.isLiked  ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          color: message.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey,
          onPressed: null,
        )
      ],
    );
  }
}

class _MessagesList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: ListView.builder(
          reverse: true,
          padding: EdgeInsets.only(top: 15.0),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index) {return _MessageWidget(messages[index]);},
        ),
      ),
    ));
  }
}

class _MessageComposer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.photo), iconSize: 25.0, color: Theme.of(context).primaryColor, onPressed: () {}),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences, onChanged: (value) {},
                decoration: InputDecoration.collapsed(hintText: 'Send a message...',),
              ),
            ),
            IconButton(icon: Icon(Icons.send), iconSize: 25.0, color: Theme.of(context).primaryColor, onPressed: () {})
          ],
        )
    );
  }

}