import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_menu_state.dart';

class BottomMenuCubit extends Cubit<BottomMenuState> {
  BottomMenuCubit() : super(const BottomMenuState());

  Future<void> setIndex(int index) async {
    emit(state.copyWith(selectedIndex: index));
  }

  Future<void> setInitialRoute(String route) async {
    emit(state.copyWith(initialRoute: route));
  }
}
