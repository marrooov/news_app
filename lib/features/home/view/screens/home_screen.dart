import 'package:flutter/material.dart';
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/features/home/data/api/api.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/view/widgets/image_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  List<Article> articles = [];
  bool isLoading = true;
  String? messageError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      appBar: AppBar(
        backgroundColor: const Color(0xff1877F2),
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : messageError != null
              ? Center(
                  child: Text(
                    messageError!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red, fontSize: 30),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ImageItemWidget(
                      image: articles[index].urlToImage ?? dummyImage,
                      title: articles[index].title ?? "Empty String $index",
                      onTap: () {},
                    );
                  },
                  itemCount: articles.length,
                ),
    );
  }

  void fetchNews() async {
    var result = await Api.getNews();
    switch(result) {
      case Success<NewsModel>():
        articles = result.data?.articles ?? [];
        break;
      case Error<NewsModel>():
        messageError = result.messageError;
        break;
    }
    isLoading = false;
    setState(() {});
  } 
}


String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';