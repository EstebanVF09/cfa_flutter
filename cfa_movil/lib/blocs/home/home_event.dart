part of 'home_bloc.dart';

sealed class HomeEvent {}

class SetIdentification extends HomeEvent {
  final String identification;

  SetIdentification({required this.identification});
}