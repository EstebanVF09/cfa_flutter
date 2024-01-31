import 'package:cfa_movil/utils/inputs_validations/identification.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeEvent>((event, emit) {});

    on<SetIdentification>((event, emit) {
      emit(state.copyWith(
          identification: Identification.dirty(event.identification)));
    });
  }
}
