import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/data/api.dart';
import 'package:news_app/widgets/image_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = {
        "status": "ok",
    "totalResults": 10153,
    "articles": []
  };
  @override
  void initState() {
    super.initState();
    getNews();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        backgroundColor: Color(0xff1877F2),
        title: Text('News App', style:
         TextStyle(color
         : Colors.white,
          fontWeight: FontWeight.bold,
           fontSize: 25)
           ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Api.getNews(),
        builder: (context, snapshot) {
          log('future builder called');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error from call get news try again later',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            );
          }
          if (snapshot.hasData) {
            log('future builder has data');
            List<dynamic> data = snapshot.data?['articles'] ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                return ImageItemWidget(
                  image: data[index]['urlToImage'] ?? dummyImage,
                  title: data[index]['title'] ?? "Empty String $index",
                  onTap: () {},
                );
              },
              itemCount: data.length,
            );
          } else {
            return Center(
              child: Text(
                'No data available',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
  void getNews() async {
    var data = await Api.getNews();
    setState(() {
      this.data = data;
    });
         }
  }


String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';