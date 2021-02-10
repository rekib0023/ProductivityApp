import 'package:http/http.dart' as http;
import 'package:productivityApp/constants/api_path.dart';
import 'package:productivityApp/models/authorize_model.dart';
import 'dart:convert';
import 'package:productivityApp/models/login_model.dart';
import 'package:productivityApp/models/register_model.dart';

class AuthService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = apiPath + "/signin";
    var bodyValue = requestModel.toJson();
    var bodyData = json.encode(bodyValue);
    var headerRequest = {"Content-Type": "application/json"};
    final response =
        await http.post(url, headers: headerRequest, body: bodyData);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<AuthResponseModel> authorize(AuthRequestModel requestModel) async {
    var bodyValue = requestModel.toJson();
    var _authKey = bodyValue["authKey"];
    var queryParams = {
      'authKey': _authKey,
    };
    String queryRequest = Uri(queryParameters: queryParams).query;
    String url = apiPath + "/authorize" + "?" + queryRequest;
    final response = await http.get(url);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return AuthResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<RegisterResponseModel> register(
      RegisterRequestModel requestModel) async {
    String url = apiPath + "/register";
    var bodyValue = requestModel.toJson();
    var bodyData = json.encode(bodyValue);
    var headerRequest = {"Content-Type": "application/json"};
    final response =
        await http.post(url, headers: headerRequest, body: bodyData);
    if (response.statusCode == 201 || response.statusCode == 400) {
      return RegisterResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
