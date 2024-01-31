import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection_blocs.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpDependencyInjection() {
  setUpDependencyInjectionBlocs(getIt);
}