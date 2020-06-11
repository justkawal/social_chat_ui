import 'dart:async';

import 'package:flutter/material.dart';

import 'box_shadow.dart';
import 'lineart_gradient.dart';

class Chatting extends StatefulWidget {
  Chatting({Key key}) : super(key: key);

  @override
  _ChattingState createState() => _ChattingState();
}

class _ChattingState extends State<Chatting> {
  List<List<String>> chats = [
    ["own_user_id", "Hey"],
    ["user1", "Heya"],
    ["own_user_id", "What are you doing?"],
    ["user1", "Nothing cool"],
    ["own_user_id", "How's you life going?"]
  ];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        _scrollToBottom();
        timer.cancel();
      }
    });
  }

  _scrollToBottom() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfffdf4f6),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Container(
            height: 210,
            decoration: BoxDecoration(
              color: Color(0xfffffefe),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(100)),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 10,
                          child: Container(
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              removeBottom: true,
                              child: ListView(
                                controller: _scrollController,
                                reverse: true,
                                children:
                                    chats.asMap().entries.map((MapEntry map) {
                                  List<String> value = map.value;
                                  return Bubble(
                                    message: value[1].toString(),
                                    isMe: value[0] == "own_user_id",
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            //color: Colors.green,
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  height: 70,
                                  padding: EdgeInsets.only(right: 9, left: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: getBoxShadowList(),
                                      borderRadius: BorderRadius.circular(70)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Type a message",
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            color: Color(0xffe3d1da),
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: getLinearGradient(),
                                          borderRadius:
                                              BorderRadius.circular(70),
                                        ),
                                        alignment: Alignment.center,
                                        child: Icon(Icons.send,
                                            color: Colors.white, size: 26),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomPaint(
                    painter: BorderPainter(),
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final radius = 100.0;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, 100);
    path.arcToPoint(Offset(100, 0), radius: Radius.circular(radius));
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Bubble extends StatelessWidget {
  Bubble({this.message, this.isMe});

  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
        colors: isMe
            ? [Color(0xffe3f3fe), Color(0xffe3f3fe)]
            : [Colors.white, Color(0xfffefcfc)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    final align = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final radius = isMe
        ? BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          )
        : BorderRadius.only(
            topRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.only(left: isMe ? 100 : 15, right: !isMe ? 100 : 15),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              boxShadow: [], borderRadius: radius, gradient: gradient),
          child: Stack(
            children: <Widget>[
              Text(
                message,
                style: TextStyle(fontSize: 20, color: Color(0xff6a515e)),
              ),
              /*
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    Icon(
                      Icons,
                      size: 12.0,
                      color: Colors.black38,
                    )
                  ],
                ),
              ) */
            ],
          ),
        )
      ],
    );
  }
}
