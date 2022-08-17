import 'dart:convert';
import 'package:http/http.dart' as http;
import '../local_save/sceure_storage.dart';
import '../model/user.dart';
import 'dart:io';
import '../utils/api_statues.dart';
import '../utils/server_config.dart';

class AuthService {
  static Future<Object> signup(User user) async {
    try {
      var response =
          await http.post(Uri.parse(baseAPI + urlSegmentSignUp + key),
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
              },
              body: userToJson(user));
      final resData = jsonDecode(response.body);
      if (SUCCESS == response.statusCode) {
        User res = userFromJson(jsonEncode(resData));
        SceureStorage storage = SceureStorage();
        await storage.save('token', res.token ?? "");
        return Success(response: res);
      } else if (resData['error'] != null) {
        return Failure(
            code: 400, errorResponse: "${resData['error']['message']}");
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

  static Future<Object> validToken(String token) async {
    try {
      var response = await http.post(
        Uri.parse(baseAPI + urlLookup + key),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
        body: jsonEncode(
          {
            "idToken": token,
          },
        ),
      );

      final resData = jsonDecode(response.body);
      if (SUCCESS == response.statusCode) {
        User res = userFromJson(jsonEncode(resData["users"][0]));

        return Success(response: res);
      } else if (resData['error'] != null) {
        return Failure(
            code: 400, errorResponse: "${resData['error']['message']}");
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }

  static Future<Object> signin(User user) async {
    try {
      var response =
          await http.post(Uri.parse(baseAPI + urlsignInWithPassword + key),
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
              },
              body: userToJson(user));
      final resData = jsonDecode(response.body);
      if (SUCCESS == response.statusCode) {
        User res = userFromJson(jsonEncode(resData));
        SceureStorage storage = SceureStorage();
        await storage.save('token', res.token ?? "");

        return Success(response: res);
      } else if (resData['error'] != null) {
        return Failure(
            code: 400, errorResponse: "${resData['error']['message']}");
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
