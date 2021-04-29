import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_with_cubit/news_cubit/news_cubit.dart';
import 'package:news_api_with_cubit/screen/news_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NewsAPI w/ Cubit'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
        ),
        alignment: Alignment.center,
        child: BlocBuilder<NewsCubit, NewsState>(builder: (context, state) {
          if (state is NewsInitial || state is NewsIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsIsLoaded) {
            print(state.newsDataList.length);
            return ListView.separated(
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => NewsDetailsScreen(
                                  newsModel: state.newsDataList[i])));
                    },
                    child: Container(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              state.newsDataList[i].urlToImage ??
                                  state.newsDataList[i].author
                                      .toString()
                                      .substring(0, 1)),
                        ),
                        title: Text(state.newsDataList[i].title),
                        subtitle: Text(
                            "${state.newsDataList[i].author} - ${state.newsDataList[i].source.name}"),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, i) => Divider(
                      thickness: 1.4,
                    ),
                itemCount: state.newsDataList.length);
          } else if (state is NewsOnError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
