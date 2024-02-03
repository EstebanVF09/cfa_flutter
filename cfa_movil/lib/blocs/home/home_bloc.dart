import 'package:cfa_movil/business_logic/entities/catalogs/document_types_entity.dart';
import 'package:cfa_movil/business_logic/repository/catalogs/catalogs_repository.dart';
import 'package:cfa_movil/exceptions/no_connection_exception.dart';
import 'package:cfa_movil/utils/inputs_validations/identification.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CatalogsRepository repository;

  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<GetDocumentTypesService>(_getDocumentTypesService);
    on<GetBannerService>(_getBannerService);

    on<SetIdentification>((event, emit) {
      emit(state.copyWith(
          identification: Identification.dirty(event.identification)));
    });

    on<SetDocumentType>((event, emit) {
      emit(state.copyWith(selectedDocumentType: event.documentType));
    });
  }
  Future<void> _getDocumentTypesService(
      GetDocumentTypesService event, Emitter<HomeState> emit) async {
    try {
      final response = await repository.getDocumentTypesService();

      if (!response.exitoso!) {
        _handleError(emit, response.descripcionError!);
        return;
      }

      emit(state.copyWith(
        formStatus: FormStatusHome.valid,
        documentTypesEntity: response.data,
      ));
    } on NoConnectionException catch (exception) {
      _handleError(emit, exception.message);
    } catch (exception) {
      _handleError(emit, 'Error en el servicio: ${exception.toString()}');
    }
  }

  Future<void> _getBannerService(
      GetBannerService event, Emitter<HomeState> emit) async {
    try {
      final response = await repository.getBannerService();

      if (response.isNotEmpty) {
        emit(state.copyWith(banners: response));
      }
    } on NoConnectionException catch (exception) {
      _handleError(emit, exception.message);
    } catch (exception) {
      _handleError(emit, 'Error en el servicio: ${exception.toString()}');
    }
  }

  void _handleError(Emitter<HomeState> emit, String msgException) {
    emit(state.copyWith(formStatus: FormStatusHome.errorService));
  }
}
