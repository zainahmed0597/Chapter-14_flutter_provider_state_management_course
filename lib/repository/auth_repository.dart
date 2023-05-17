import 'package:flutter_provider_state_management_course/data/network/BaseApiServices.dart';
import 'package:flutter_provider_state_management_course/data/network/NetworkApiServices.dart';
import 'package:flutter_provider_state_management_course/resources/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
