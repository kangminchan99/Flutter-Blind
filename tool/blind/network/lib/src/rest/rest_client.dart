import 'package:core_network/network.dart';

class BlindRestClient extends RestClient {
  BlindRestClient() : super(baseUrl: 'http://127.0.0.1:8080');
}
