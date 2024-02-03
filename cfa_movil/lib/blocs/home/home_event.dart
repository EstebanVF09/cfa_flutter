part of 'home_bloc.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class SetIdentification extends HomeEvent {
  final String identification;

  SetIdentification({required this.identification});
}

class GetDocumentTypesService extends HomeEvent {}

class GetBannerService extends HomeEvent {}

class SetDocumentType extends HomeEvent {
  final DataDocumentTypesEntity documentType;
  const SetDocumentType({required this.documentType});
}
