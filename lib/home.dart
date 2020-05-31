import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'character.dart';

const itemSize = 200.0;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  void onListen() {
    setState(() {});
  }

  @override
  void initState() {
    characters.addAll(List.from(characters));
    scrollController.addListener(onListen);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Animation'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.notifications_none,
                color: Colors.white70,
                size: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.sort,
                color: Colors.white70,
                size: 30,
              ),
              SizedBox(
                width: 30,
              ),
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Container(
              height: 350,
//             color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Row(
                          children: <Widget>[
                            Text(
                              'Popular now ',
                              style: TextStyle(
                                color: Colors.white54.withOpacity(.2),
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.stars,
                              color: Colors.white54.withOpacity(.2),
                            )
                          ],
                        )),
                        Row(
                          children: <Widget>[
                            Text(
                              'Coupons',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.monetization_on,
                              color: Colors.amber,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Discover",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(fontSize: 16, color: Colors.white60),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          ContainetHoriz(context, Colors.blue[400],
                              'Most Favouriters Anime', false),
                          ContainetHoriz(context, Colors.orange[400],
                              'Newests Anime', true),
                          ContainetHoriz(context, Colors.blueGrey[400],
                              'oldests Anime', true),
                          ContainetHoriz(context, Colors.red[400],
                              'Most Favouriters Anime', false),
                          ContainetHoriz(context, Colors.green[400],
                              'Most Favouriters Anime', false),
                          ContainetHoriz(context, Colors.purple[400],
                              'Most Favouriters Anime', true)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Anime',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            SliverToBoxAdapter(
              child: const SizedBox(
                height: 50,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final character = characters[index];
                final itemPositionOffset = index * itemSize * 0.5;
                final difference = scrollController.offset - itemPositionOffset;
                final percent = 1 - (difference / (itemSize * 0.5));
                double opacity = percent;
                double scale = percent;
                if (opacity > 1.0) opacity = 1.0;
                if (opacity < 0.0) opacity = 0.0;
                if (percent > 1.0) scale = 1.0;
                return Align(
                  heightFactor: 0.5,
                  child: Opacity(
                    opacity: opacity,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()..scale(scale, 1.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                        )),
                        color: Color(character.color),
                        child: SizedBox(
                          height: itemSize,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(15),
                              )),
                              Image.asset(character.avatar)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }, childCount: characters.length),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.all(6),
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
        ),
        child: Icon(
          Icons.home,
          size: 40,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(6),
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.shopping_cart,
                      size: 40,
                      color: Colors.white,
                    ),
                    Text('Card',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              SizedBox(width: 200,),
              Container(
                margin: EdgeInsets.all(6),
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.white,
                    ),
                    Text('Search',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContainetHoriz(
      BuildContext context, Color color, String title, bool favour) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 50,
        width: 175,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0), color: color),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    favour ? Icons.favorite : Icons.favorite_border,
                    size: 40,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
