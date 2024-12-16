import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'BASE_URL_GOOGLE_MAPS')
  static const String baseUrlGoogleMaps = _Env.baseUrlGoogleMaps;

  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY')
  static const String googleMapsApiKey = _Env.googleMapsApiKey;
}
