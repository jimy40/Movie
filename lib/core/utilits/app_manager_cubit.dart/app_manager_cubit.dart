import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_states.dart';

class AppManagerCubit extends Cubit<AppManagerStates> {
  AppManagerCubit() : super(AppManagerInitial());

  int movieTypeCurrentIndex = 0;
  void changeMovieType(int index) {
    movieTypeCurrentIndex = index;
    emit(AppManagerChangeMovieTypeState());
  }

  int moviedetailsIndex = 0;

  void changeMoviedetailsData(int index) {
    moviedetailsIndex = index;
    emit(AppManagerChangeMovieDetailsState());
  }

  bool isSelected = false;
  void addToFavorite() {
    isSelected = !isSelected;
    emit(AppManagerChangeToFavoriateState());
  }
}
