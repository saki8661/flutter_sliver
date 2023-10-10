import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // = appbar
          SliverAppBar(
            snap: true,
            floating: true,
            // pinned가 false일 때, 제일 상단으로 가지 않아도
            // 스크롤 방향을 위로 가도록 손으로 튕기면
            // 숨겨진 "appbar2"가 생긴다.
            // snap이 있다면 자동으로 1번까지 올라가고,
            // snap이 없다면 1번까지 올라가지 않지만, "appbar2"를 보여준다.

            pinned: false, // appbar 고정 X
            title: Text("appbar2", style: TextStyle(color: Colors.white)),
            expandedHeight: 250, // 확장될 수 있는 최대 공간
            flexibleSpace: Container(
              // appbar에 image 넣기
              child: Image.network(
                "https://picsum.photos/200/300",
                fit: BoxFit.cover,
              ),
            ),

            // flexibleSpace: FlexibleSpaceBar()
            // 같은 appbar의 공간으로,
            // 스크롤 시 Flexible의 공간이 사라지기 전까지 "appbar2"는 유지한다.
          ),

          SliverAppBar(
            pinned: true, // appbar 고정 O
            title: Text("appbar1", style: TextStyle(color: Colors.white)),
          ),

          // = ListView
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person),
                          Column(
                            children: [
                              Text("Name"),
                              Text("Home"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text("Product"),
                          SizedBox(),
                          Text("TextPlain"),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
