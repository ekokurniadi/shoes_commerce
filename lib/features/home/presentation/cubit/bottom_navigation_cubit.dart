import 'package:bloc/bloc.dart';

class BottomNavigationCubit extends Cubit<int> {
  BottomNavigationCubit() : super(0);

  void setIndex(int newIndex) async {
    emit(newIndex);
  }
}
