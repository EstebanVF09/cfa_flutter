import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection_blocs.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection_datasources.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection_repositories.dart';
import 'package:cfa_movil/setup_dependency_injection/setup_dependency_injection_utils.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpDependencyInjection() {
  
  setUpDependencyInjectionUtils(getIt);

  setUpDependencyInjectionDatasources(getIt);

  setUpDependencyInjectionRepositories(getIt);

  setUpDependencyInjectionBlocs(getIt);
}
