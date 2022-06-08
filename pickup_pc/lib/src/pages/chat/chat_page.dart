import 'dart:async';

import 'package:flutter/material.dart';

import '../../model/chatMessage.dart';

class ChatPage extends StatefulWidget {
   @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 3,),
                CircleAvatar(
                  backgroundImage: NetworkImage("<https://firebasestorage.googleapis.com/v0/b/pick-up-pc.appspot.com/o/user_monitor.png?alt=media&token=aa6294a5-21ac-4ba8-b2b3-e52ef994156d>"),
                  
                  maxRadius: 25,
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Monitor",style: TextStyle( fontSize: 16 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                      Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
                Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
      body:Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.red[400]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
        ),
      ),
    );
  },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){},
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.red,
                    elevation: 0,
                  // messages.insert(5, messageContent: "En unos momentos te confirmamos para que pases por el pc.", messageType: "receiver"),
                  ),
                ],
                
              ),
            ),
          ),
        ],
      ),
  
    );
  }

List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hola Yimar", messageType: "receiver"),
    ChatMessage(messageContent: "Espero que estes bien", messageType: "receiver"),
    ChatMessage(messageContent: "Ya vamos ayudarte a instalar las aplicaciones", messageType: "receiver"),
    ChatMessage(messageContent: "En unos momentos te confirmamos para que pases por el pc.", messageType: "receiver"),
  ChatMessage(messageContent: "Listo, gracias!", messageType: "sender"),
  ];
  
}