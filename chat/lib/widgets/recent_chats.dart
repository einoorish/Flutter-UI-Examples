import 'package:chat/models/data_pump.dart';
import 'package:chat/models/message.dart';
import 'package:chat/views/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index) {
              final Message chat = chats[index];
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(user: chat.sender),),),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    color: chat.unread ? Color.fromRGBO(171, 212, 212, 0.25) : Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(backgroundImage: AssetImage(chat.sender.imageUrl), radius: 35.0),
                          SizedBox(width: 10.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                chat.sender.name,
                                style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold,),
                              ),
                              SizedBox(height: 5.0),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(
                                  chat.text,
                                  style: TextStyle(color: Colors.blueGrey, fontSize: 15.0, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            chat.time,
                            style: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold,),
                          ),
                          SizedBox(height: 5.0),
                          if(chat.unread)
                             Container(
                              width: 40.0, height: 20.0,
                              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(30.0),),
                              alignment: Alignment.center,
                              child: Text(
                                'NEW',
                                style: TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                              ),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}