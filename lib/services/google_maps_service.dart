import "package:dasarata_mobile/env/env.dart";
import "package:dasarata_mobile/models/maps/spliter_maps_model.dart";
import "package:dasarata_mobile/utilities/shared_pref.dart";
import "package:dio/dio.dart";
import "package:geocoding/geocoding.dart";
import "package:geolocator/geolocator.dart";

class GoogleMapsService {
  final Dio _dio = Dio();

  Future<List<Placemark>> getPlacemarks(
      double latitude, double longitude) async {
    const url = "${Env.baseUrlGoogleMaps}/geocode/json";
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          "latlng": "$latitude, $longitude",
          "key": Env.googleMapsApiKey,
        },
      );
      if (response.data["status"] == "OK") {
        final List<dynamic> rawResponse = response.data["results"];
        List<Placemark> placemarks = [];

        for (var item in rawResponse) {
          final addressComponents = item["address_components"] as List<dynamic>;
          String? getValueAddressComponent(
              List<dynamic> components, String type) {
            for (var component in components) {
              if ((component["types"] as List).contains(type)) {
                return component["long_name"] as String?;
              }
            }
            return null;
          }

          String? name = item["formatted_address"];
          String? street =
              getValueAddressComponent(addressComponents, "route") ??
                  getValueAddressComponent(addressComponents, "plus_code");
          String? country =
              getValueAddressComponent(addressComponents, "country");
          String? postalCode =
              getValueAddressComponent(addressComponents, "postal_code");
          String? administrativeArea = getValueAddressComponent(
              addressComponents, "administrative_area_level_1");
          String? subAdministrativeArea = getValueAddressComponent(
              addressComponents, "administrative_area_level_2");
          String? locality = getValueAddressComponent(
              addressComponents, "administrative_area_level_3");
          String? subLocality = getValueAddressComponent(
              addressComponents, "administrative_area_level_4");

          placemarks.add(
            Placemark(
              name: name,
              street: street,
              country: country,
              postalCode: postalCode,
              administrativeArea: administrativeArea,
              subAdministrativeArea: subAdministrativeArea,
              locality: locality,
              subLocality: subLocality,
            ),
          );
        }
        return placemarks;
      } else {
        throw Exception(response.data["status"].toString);
      }
    } on DioException {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getPlacemarkFromAddressPlusCode(
      String data) async {
    const url = "${Env.baseUrlGoogleMaps}/geocode/json";
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          "key": Env.googleMapsApiKey,
          "address": data,
        },
      );

      if (response.data["status"] == "OK") {
        final List<dynamic> rawResponse = response.data["results"];
        List<Placemark> placemarks = [];
        Position? position;

        for (var item in rawResponse) {
          final addressComponents = item["address_components"] as List<dynamic>;
          final geometryComponents =
              item["geometry"]["location"] as Map<String, dynamic>;

          String? getValueAddressComponent(
              List<dynamic> components, String type) {
            for (var component in components) {
              if ((component["types"] as List).contains(type)) {
                return component["long_name"] as String?;
              }
            }
            return null;
          }

          double getValueGeometryComponent(
              Map<String, dynamic> components, String type) {
            return components[type] as double;
          }

          String? name = item["formatted_address"];
          String? street =
              getValueAddressComponent(addressComponents, "route") ??
                  getValueAddressComponent(addressComponents, "plus_code");
          String? country =
              getValueAddressComponent(addressComponents, "country");
          String? postalCode =
              getValueAddressComponent(addressComponents, "postal_code");
          String? administrativeArea = getValueAddressComponent(
              addressComponents, "administrative_area_level_1");
          String? subAdministrativeArea = getValueAddressComponent(
              addressComponents, "administrative_area_level_2");
          String? locality = getValueAddressComponent(
              addressComponents, "administrative_area_level_3");
          String? subLocality = getValueAddressComponent(
              addressComponents, "administrative_area_level_4");

          placemarks.add(
            Placemark(
              name: name,
              street: street,
              country: country,
              postalCode: postalCode,
              administrativeArea: administrativeArea,
              subAdministrativeArea: subAdministrativeArea,
              locality: locality,
              subLocality: subLocality,
            ),
          );

          position = Position(
            timestamp: DateTime.now(),
            latitude: getValueGeometryComponent(geometryComponents, "lat"),
            longitude: getValueGeometryComponent(geometryComponents, "lng"),
            accuracy: 0,
            altitude: 0,
            altitudeAccuracy: 0,
            heading: 0,
            headingAccuracy: 0,
            speed: 0,
            speedAccuracy: 0,
          );
        }

        return {
          "placemarks": placemarks,
          "position": position,
        };
      } else if (response.data["status"] == "ZERO_RESULTS") {
        throw "Tidak ada lokasi yang sesuai";
      } else {
        throw Exception(response.data["status"].toString());
      }
    } on DioException {
      rethrow;
    }
  }

  Future<SpliterMapsModel> getSpliters() async {
    const url = "${Env.baseUrl}/sales/spliters";
    final token = await SharedPref.getToken();
    try {
      final response = await _dio.get(
        url,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ),
      );
      final rawResponse = response.data;
      return SpliterMapsModel.fromJson(rawResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw SpliterMapsModel(
          success: "failed",
          message: "404: Data tidak ditemukan",
        );
      } else {
        final errorResponse = e.response?.data;
        if (errorResponse != null) {
          throw SpliterMapsModel.fromJson(errorResponse);
        } else {
          throw SpliterMapsModel(
            success: "failed",
            message: "Tidak terhubung ke internet",
          );
        }
      }
    }
  }
}
