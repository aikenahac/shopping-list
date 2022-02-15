import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shopping_list/api/exceptions/bad_request.exception.dart';
import 'package:shopping_list/api/exceptions/forbidden.exception.dart';

// Class that holds all the network requests
class API {
  static const String apiUrl = 'https://sl.aikenahac.com/api';

  // GET function
  // Retrieves JSON data from the API to the app
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse(apiUrl + endpoint);

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(
      url,
      headers: headers,
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    return responseBody;
  }

  // POST function
  // Sends JSON data to the app from the API
  // Used for adding new items
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(apiUrl + endpoint);

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode > 299) {
      switch (response.statusCode) {
        case 400:
          throw BadRequestException(responseBody['error']['message']);
        case 403:
          throw ForbiddenException(responseBody['error']['message']);
      }
    }

    return responseBody;
  }

  // PUT function
  // Sends JSON data to the app from the API
  // Used for updating existing items
  static Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse(apiUrl + endpoint);

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.put(
      url,
      headers: headers,
      body: jsonEncode(body),
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode > 299) {
      switch (response.statusCode) {
        case 400:
          throw BadRequestException(responseBody['error']['message']);
        case 403:
          throw ForbiddenException(responseBody['error']['message']);
      }
    }

    return responseBody;
  }

  // DELETE function
  // Deletes an existing item from the app
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse(apiUrl + endpoint);

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.delete(
      url,
      headers: headers,
    );

    final Map<String, dynamic> responseBody = jsonDecode(response.body);

    if (response.statusCode > 299) {
      switch (response.statusCode) {
        case 400:
          throw BadRequestException(responseBody['error']['message']);
        case 403:
          throw ForbiddenException(responseBody['error']['message']);
      }
    }

    return responseBody;
  }
}
