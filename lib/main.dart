import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);
final double g_height = 120;
final double g_width = 200;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green,),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(title: Text('我的自傳'),
        centerTitle: true,),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '自我介紹',),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程',),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫',),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向',),
        ],
        onTap: (index) {
          setState(() {
            previousIndex=currentIndex;
            currentIndex=index;
            if (index==0) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index==1) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index==2) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index==3) {
              if (previousIndex==currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),

    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1='姓名：劉子謙\n身份：學生 - 大學\n就讀學校：國立高雄科技大學(舊高應大)\n\n'
      '簡單自介：獨生子，個性內向，父母自營餐飲業，喜歡思考一些像是電腦怎麼用作之類的問題'
      '，也可以說是好奇吧。無工作經驗，擅長邏輯思考，興趣無。最近為了加強英文開始會閱讀英文文章'
      '(新聞之類的)';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text('自我介紹', style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold),),
          ),
          //自傳部分
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width:3), // 框線
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amber.shade300, offset: Offset(6, 6)), // offset 陰影偏移
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20),), // 框內文字大小
          ),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {

  final double g_fontSize = 20; // 字體大小示例

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 50), // 只設置底部間距
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3), // 框線
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade50, offset: Offset(6, 6)),
                  ],
                ),
                child: Text('小學：台中市力行國小', style: TextStyle(fontSize: g_fontSize)),
              ),
            ],
          ),  // 小學
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 50), // 只設置底部間距
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3), // 框線
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade100, offset: Offset(6, 6)),
                  ],
                ),
                child: Text('國中：臺中市立居仁國民中學', style: TextStyle(fontSize: g_fontSize)),
              ),
            ],
          ),  // 國中
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 50), // 只設置底部間距
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3), // 框線
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade200, offset: Offset(6, 6)),
                  ],
                ),
                child: Text('高職：臺中市立霧峰農業工業高級中等學校\n系所：電子科'
                    , style: TextStyle(fontSize: g_fontSize)),
              ),
            ],
          ),  // 高職
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 50), // 只設置底部間距
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3), // 框線
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade300, offset: Offset(6, 6)),
                  ],
                ),
                child: Text('大學：國立高雄科技大學(舊高應大)\n系所：資工系', style: TextStyle(fontSize: g_fontSize)),
              ),
            ],
          ),  // 大學
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 50), // 只設置底部間距
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3), // 框線
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.green.shade400, offset: Offset(6, 6)),
                  ],
                ),
                child: Text('碩士：(未考慮就讀)', style: TextStyle(fontSize: g_fontSize)),
              ),
            ],
          ),  // 碩士
        ],
      ),
    );
  }
}


class Screen3 extends StatelessWidget {

  final double g_fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期', style: TextStyle(fontSize: g_fontSize),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: g_height,
                width: g_width,
                child: ListView(
                  children: [
                    Text('1. 人際關係', style: TextStyle(fontSize: g_fontSize),),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大二時期', style: TextStyle(fontSize: g_fontSize),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: g_height,
                width: g_width,
                child: ListView(
                  children: [
                    Text('無, 學校教啥就讀啥', style: TextStyle(fontSize: g_fontSize),),
                  ],
                ),
              ),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大三時期', style: TextStyle(fontSize: g_fontSize),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: g_height,
                width: g_width,
                child: ListView(
                  children: [
                    Text('1. 準備專題', style: TextStyle(fontSize: g_fontSize),),
                    Text('2. 閱讀英文文章', style: TextStyle(fontSize: g_fontSize),),
                    Text('3. 熟讀資工系必修', style: TextStyle(fontSize: g_fontSize),),
                  ],
                ),
              ),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大四時期', style: TextStyle(fontSize: g_fontSize),),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: g_height,
                width: g_width,
                child: ListView(
                  children: [
                    Text('1. 閱讀英文文章', style: TextStyle(fontSize: g_fontSize),),
                    Text('2. 了解資工系未來出入', style: TextStyle(fontSize: g_fontSize),),
                  ],
                ),
              ),
            ],),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('None', style: TextStyle(fontSize: 20),),
      ),
    );
  }
}
