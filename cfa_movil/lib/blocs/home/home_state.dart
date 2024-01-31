part of 'home_bloc.dart';

enum FormStatusHome {
  invalid,
  valid,
  validating,
  posting,
}

class HomeState extends Equatable {
  final Identification identification;
  final FormStatusHome formStatus;

  const HomeState({
    this.identification = const Identification.pure(),
    this.formStatus = FormStatusHome.invalid,
  });

  HomeState copyWith({
    Identification? identification,
    FormStatusHome? formStatus,
  }) =>
      HomeState(
        identification: identification ?? this.identification,
        formStatus: formStatus ?? this.formStatus,
      );

  @override
  List<Object> get props => [
        identification,
        formStatus,
      ];
}
