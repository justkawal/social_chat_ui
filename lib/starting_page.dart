import 'package:flutter/material.dart';

import 'dots.dart';

class StartingPage extends StatefulWidget {
  StartingPage({Key key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  final _controller = PageController(viewportFraction: 0.88);

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  static Radius radius = Radius.circular(115);

  List<String> imageNames = [
    "photos",
    "art1",
    "art2",
    "photos",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffffffff),
      height: MediaQuery.of(context).size.height,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfff2c8d0), Color(0xfff4cdd9)],
                ),
              ),
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .30),
                    height: MediaQuery.of(context).size.height,
                    color: Color(0xfffcf4f6),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [.4, 1],
                            colors: [
                              Color(0xfff2c8d0),
                              Color(0xfff4cdd9),
                            ],
                          ),
                          borderRadius: BorderRadius.only(topLeft: radius)),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(height: 95),
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: PageView.builder(
                                itemCount: 4,
                                physics: AlwaysScrollableScrollPhysics(),
                                controller: _controller,
                                onPageChanged: (index1) {},
                                itemBuilder: (BuildContext context, int index) {
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          print("Image Clicked");
                                        });
                                      },
                                      child: Image(
                                        gaplessPlayback: true,
                                        image: AssetImage(
                                            "assets/${imageNames[index]}.png"),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * .70,
                                  height: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 35),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xfff5ac91),
                                        Color(0xffb99fc5),
                                        Color(0xff7abaf1),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "Get Started",
                                        maxLines: 1,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22),
                                      ),
                                      Icon(Icons.arrow_forward,
                                          color: Colors.white, size: 30),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 269,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(left: 40, right: 60, top: 70),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [-.1, 1],
                          colors: [
                            Color(0xffffffff),
                            Color(0xfffcf4f6),
                          ],
                        ),
                        borderRadius: BorderRadius.only(bottomRight: radius)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'The best photos from good people',
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style:
                              TextStyle(fontSize: 30, color: Color(0xff6a515e)),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          child: Dots(
                            controller: _controller,
                            itemCount: 4,
                            onPageSelected: (int page) {
                              _controller.animateToPage(
                                page,
                                duration: _kDuration,
                                curve: _kCurve,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
