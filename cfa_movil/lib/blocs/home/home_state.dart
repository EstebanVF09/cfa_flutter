part of 'home_bloc.dart';

enum FormStatusHome { invalid, valid, validating, posting, errorService }

class HomeState extends Equatable {
  final Identification identification;
  final FormStatusHome formStatus;
  final List<DataDocumentTypesEntity> documentTypesEntity;
  final DataDocumentTypesEntity? selectedDocumentType;
  final List<String> banners;
  final int selectedIndex;

  const HomeState({
    this.identification = const Identification.pure(),
    this.formStatus = FormStatusHome.invalid,
    this.documentTypesEntity = const [],
    this.selectedDocumentType,
    this.banners = const [],
    this.selectedIndex = 0,
  });

  HomeState copyWith({
    Identification? identification,
    FormStatusHome? formStatus,
    List<DataDocumentTypesEntity>? documentTypesEntity,
    DataDocumentTypesEntity? selectedDocumentType,
    List<String>? banners,
  }) =>
      HomeState(
        identification: identification ?? this.identification,
        formStatus: formStatus ?? this.formStatus,
        documentTypesEntity: documentTypesEntity ?? this.documentTypesEntity,
        selectedDocumentType: selectedDocumentType ?? this.selectedDocumentType,
        banners: banners ?? this.banners,
      );

  @override
  List<Object?> get props => [
        identification,
        formStatus,
        documentTypesEntity,
        selectedDocumentType,
        banners,
      ];
}
