part of 'home_bloc.dart';

enum FormStatusHome { invalid, valid, validating, posting, errorService }

class HomeState extends Equatable {
  final Identification identification;
  final FormStatusHome formStatus;
  final List<String> banners;

  const HomeState({
    this.identification = const Identification.pure(),
    this.formStatus = FormStatusHome.invalid,
    this.banners = const [],
  });

  HomeState copyWith({
    Identification? identification,
    FormStatusHome? formStatus,
    List<String>? banners,
  }) =>
      HomeState(
        identification: identification ?? this.identification,
        formStatus: formStatus ?? this.formStatus,
        banners: banners ?? this.banners,
      );

  @override
  List<Object?> get props => [
        identification,
        formStatus,
        banners,
      ];
}
