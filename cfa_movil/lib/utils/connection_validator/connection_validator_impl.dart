import 'package:cfa_movil/exceptions/no_connection_exception.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'connection_validator.dart';

class ConnectionValidatorImpl extends ConnectionValidator {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<void> isConnectedToTheInternet() async {
    final response = await _connectivity.checkConnectivity();
    if (response == ConnectivityResult.none) throw NoConnectionException();
  }
}
