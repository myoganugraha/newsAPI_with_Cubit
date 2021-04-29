import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_api_with_cubit/model/news_model.dart';
import 'package:news_api_with_cubit/services/news_services.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  Future<void> getNewsList() async {
    try {
      emit(NewsIsLoading());
      final newsDataList = await NewsServices().getTopHeadlines();
      emit(NewsIsLoaded(newsDataList));
    } catch (error) {
      print(error.toString());
      emit(NewsOnError(error.toString()));
    }
  }
}
