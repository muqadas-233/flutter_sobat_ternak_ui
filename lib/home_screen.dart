import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
            children: [
              _buildAppBar(),
              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildPriceContainer(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Latest Products',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('View All',
                                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(4, (index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage('assets/animal$index.png'),
                                    ),
                                    SizedBox(height: 5),
                                    Text('Product ${index + 1}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                                    Text('Price: ${(index + 1) * 5000}',
                                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildPostBox(),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
          ),
          Text(
            'Sobat Ternak',
            style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(6),
            child: Icon(Icons.message, color: Colors.purple),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceContainer() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item Prices', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  Text('Today', style: TextStyle(color: Colors.purple)),
                  Icon(Icons.arrow_drop_down, color: Colors.purple),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey[300]),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/animal$index.png'),
                      ),
                      SizedBox(height: 5),
                      Text('${(index + 1) * 2000}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 15),
          Divider(thickness: 1, color: Colors.grey[300]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _iconWithText(Icons.thumb_up_alt_outlined, "Like"),
              _iconWithText(Icons.comment_outlined, "Comment"),
              _iconWithText(Icons.share_outlined, "Share"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconWithText(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.purple),
        SizedBox(height: 4),
        Text(text, style: TextStyle(color: Colors.purple)),
      ],
    );
  }

  Widget _buildPostBox() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, spreadRadius: 2)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/profile.png'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text('Martin Palmer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 10),
          Text('New Post Added Lorem Ipsum is a Dummy Text',
              style: TextStyle(fontSize: 14, color: Colors.black87)),
          SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('assets/post.png',
                height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      color: Colors.purple,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 40),
                Icon(Icons.favorite, color: Colors.white),
              ],
            ),
            Row(
              children: [
                Icon(Icons.notifications, color: Colors.white),
                SizedBox(width: 40),
                Icon(Icons.person, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
