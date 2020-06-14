import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_mobile_app/messages.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int itemCount = 10;
  ScrollController _scrollController;
  bool showProfilePic = false, showName = false;
  List<List<String>> followersList = [
    ["Photos", "1110"],
    ["Followers", "320k"],
    ["Follows", "3000"]
  ];

  String profileImage = "assets/profile.png";

  List<String> images = [
    "art3",
    "art2",
    "art4",
    "art5",
    "art1",
    "art5",
    "art3",
    "art2",
    "art4",
    "art5"
  ];
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >= 197.0) {
          if (!showProfilePic) {
            setState(() {
              showProfilePic = true;
            });
          }
        } else {
          if (showProfilePic) {
            setState(() {
              showProfilePic = false;
            });
          }
        }

        if (_scrollController.offset >= 259.0) {
          if (!showName) {
            setState(() {
              showName = true;
            });
          }
        } else {
          if (showName) {
            setState(() {
              showName = false;
            });
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            getHeader(),
            Expanded(
              child: Container(
                color: Colors.white,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                      Container(
                        height: 465,
                        child: Stack(
                          children: <Widget>[
                            getMyProfile(),
                            getFollowersBar(),
                          ],
                        ),
                      ),
                      getWidgetList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getMyProfile() {
    return Container(
      height: 325,
      color: Color(0xfffbeeef),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color(0xfffdf6f7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My Profile",
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    color: Color(0xff6a515e),
                    fontSize: 33,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 25),
                height: 180,
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xfff6d2eb),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffae3f2),
                            blurRadius: 26,
                            spreadRadius: -21,
                            offset: Offset(0, 34)),
                      ],
                      borderRadius: BorderRadius.circular(65)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(65),
                    child: Image(
                      width: 130,
                      height: 130,
                      image: AssetImage(profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Robert Downey",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Color(0xff6a515e),
                      fontSize: 29,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "@iron_man",
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Color(0xffc7abba),
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///Followers bar
  Widget getFollowersBar() {
    return Positioned(
      top: 325,
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Color(0xfffdf6f7), Colors.white],
              stops: [0, .22, .1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomRight: Radius.circular(100)),
            child: Container(
              padding: const EdgeInsets.only(top: 40, left: 8, right: 8),
              color: Color(0xfffbeeef),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: followersList.toList().map((element) {
                  return Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          element[0],
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Color(0xffc7abba),
                              fontSize: 19,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          element[1],
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: Color(0xff6a515e),
                              fontSize: 21,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )),
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
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
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
              SizedBox(width: 10),
              if (showProfilePic)
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xfffae3f2),
                            blurRadius: 21,
                            spreadRadius: -12,
                            offset: Offset(6, 6)),
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image(
                      image: AssetImage(profileImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(width: 10),
              if (showName)
                Container(
                  height: 40,
                  width: 170,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Robert Downey",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xff6a515e),
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Messages()),
              );
            },
            child: Icon(
              Icons.more_vert,
              size: 30,
              color: Color(0xff6a515e),
            ),
          ),
        ],
      ),
    );
  }

  Widget getWidgetList() {
    return Container(
      height: 640,
      color: Color(0xfffbeeef),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(100)),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
          width: MediaQuery.of(context).size.width,
          child: StaggeredGridView.count(
            primary: false,
            crossAxisCount: 4,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: false,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 20.0,
            children: getWidgetItemsList(),
            staggeredTiles: const <StaggeredTile>[
              const StaggeredTile.count(2, 2),
              const StaggeredTile.count(2, 1),
              const StaggeredTile.count(2, 2),
              const StaggeredTile.count(2, 2),
              const StaggeredTile.count(2, 1),
              const StaggeredTile.count(1, 2),
              const StaggeredTile.count(1, 2),
              const StaggeredTile.count(2, 1),
              const StaggeredTile.count(1, 2),
              const StaggeredTile.count(1, 1),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgetItemsList() {
    return List.generate(10, (index) => index)
        .asMap()
        .entries
        .map((MapEntry map) {
      return Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffecc8d1),
              borderRadius: BorderRadius.circular(35)),
          child: Image(
            image: AssetImage("assets/${images[map.key]}.png"),
          ));
    }).toList();
  }
}
