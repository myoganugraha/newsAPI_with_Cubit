part of 'news_cubit.dart';

@immutable
abstract class NewsState {
  const NewsState();
}

class NewsInitial extends NewsState {}

class NewsIsLoading extends NewsState {
  const NewsIsLoading();
}

class NewsIsLoaded extends NewsState {
  final List<NewsModel> newsDataList;
  const NewsIsLoaded(this.newsDataList);
}

class NewsOnError extends NewsState {
  final String message;
  const NewsOnError(this.message);
}
