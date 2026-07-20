import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/view/widgets/image_item_widget.dart';
import 'package:news_app/features/home/view_model/view_cubit/home_cubit.dart';
import 'package:news_app/features/home/view_model/view_cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = 'HomeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles = [];
  bool isLoading = true;
  String? messageError;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchNews(),
      child: Scaffold(
        backgroundColor: Color(0xff202020),
        appBar: AppBar(
          backgroundColor: Color(0xff1877F2),
          title: Text(
            'News App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state) {
              case HomeInitial():
                return SizedBox.shrink();
              case HomeLoading():
                return Center(child: CircularProgressIndicator());
              case HomeSuccess():
                articles = state.articles;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ImageItemWidget(
                      image: state.articles[index].urlToImage ?? dummyImage,
                      title: state.articles[index].title ?? "Empty String ",
                      onTap: () {},
                    );
                  },
                  itemCount: state.articles.length,
                );
              case HomeError():
                messageError = state.messageError;
                return Center(
                  child: Text(
                    state.messageError ??
                        'Error from call get news try again later',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 30),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

String dummyImage =
    'https://images.theconversation.com/files/651621/original/file-20250226-32-jxjhmy.jpg?ixlib=rb-4.1.0&rect=0%2C0%2C5991%2C3997&q=20&auto=format&w=320&fit=clip&dpr=2&usm=12&cs=strip';
