import 'package:connectivity/connectivity.dart';

class ConnectivityChangeEvent{
  final ConnectivityResult type;
  const ConnectivityChangeEvent(this.type);
}