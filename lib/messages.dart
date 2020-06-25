import 'package:flutter/material.dart';
import 'package:social_mobile_app/chatting.dart';
import 'box_shadow.dart';
import 'lineart_gradient.dart';

class Messages extends StatefulWidget {
  Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  double screenWidth = 180;
  Map<String, String> names = {
    "user1": "Robert Downey",
    "user2": "Milanda Hery",
    "user3": "Anonymous Bond",
    "user4": "Jordan Porke",
    "user5": "Steven Marverik",
    "user6": "Bandi Santel",
  };
  Map<String, List<List<String>>> chats = {
    "user1": [
      ["own_user_id", "I am open for flutter dev"],
      ["user3", "Okay Let me find you a job. "],
      ["own_user_id", "Thank u so much"],
      ["user3", "Cool We have one vacancy for Flutter UI Designer"],
      ["own_user_id", "I am interested"],
      ["user3", "Cool You are Hired."],
    ],
    "user2": [
      ["own_user_id", "I am cool"],
      ["user2", "So what?"],
      ["own_user_id", "Nothing Just telling."],
      ["user2", "Okay"],
      ["own_user_id", "I am cool"],
      ["user2", "Got it"]
    ],
    "user3": [
      ["own_user_id", "Hey"],
      ["user1", "Heya"],
      ["own_user_id", "What are you doing?"],
      ["user1", "Nothing cool"],
      ["own_user_id", "How's your life going?"]
    ],
    "user4": [
      ["own_user_id", "Hey Jordan"],
      ["user1", "Yup Say ?"],
      ["own_user_id", "I am sending you some money?"],
      ["user1", "Y not"],
      ["own_user_id", "Can I pay u via Google-Pay or Paypal."]
    ]
  };
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Color(0xfffcf3f4)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getHeader(),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Chats",
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        color: Color(0xff6a515e),
                        fontSize: 33,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenWidth - 60,
                        height: 70,
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: getBoxShadowList(),
                            borderRadius: BorderRadius.circular(70)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: getLinearGradient(),
                                borderRadius: BorderRadius.circular(70),
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.search,
                                  color: Colors.white, size: 30),
                            ),
                            SizedBox(width: 20),
                            Container(
                              height: 50,
                              width: screenWidth - 160,
                              child: TextFormField(
                                cursorColor: Color(0xffe3d1da),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintStyle: const TextStyle(
                                        color: Color(0xffe3d1da)),
                                    disabledBorder: InputBorder.none,
                                    contentPadding:
                                        const EdgeInsets.only(right: 15),
                                    hintText: "Search"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView(
                      children: chats.entries.map((MapEntry map) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Chatting(
                                          name: names[map.key] ??
                                              map.key.toString(),
                                          chats: map.value,
                                        )),
                              );
                            },
                            child: getListItem(map));
                      }).toList(),
                    ),
                  ),
                ))
              ],
            ),
            Positioned(
              bottom: 43,
              right: 30,
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: getLinearGradient(),
                  borderRadius: BorderRadius.circular(70),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.create, color: Colors.white, size: 37),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getListItem(MapEntry map) {
    List<List<String>> value = map.value;
    return Container(
      width: screenWidth - 60,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 9),
      margin: const EdgeInsets.only(bottom: 21),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                boxShadow: getBoxShadowList()),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage("assets/profile.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenWidth - 150,
                child: Text(
                  names[map.key] ?? map.key.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Color(0xff6a515e),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: screenWidth - 150,
                child: Text(
                  value[value.length - 1][1].toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff6a515e),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getHeader() {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Color(0xfffefafb)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Color(0xff6a515e),
            ),
          ),
          Icon(
            Icons.more_vert,
            size: 30,
            color: Color(0xff6a515e),
          ),
        ],
      ),
    );
  }
}
