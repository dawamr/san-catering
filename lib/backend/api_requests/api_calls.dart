import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Menu List Group Code

class MenuListGroup {
  static String getBaseUrl() => 'https://local.dawam.shop/api/menu-lists';
  static Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Flutter-Flow': 'dawamraja',
  };
  static MenuListCall menuListCall = MenuListCall();
}

class MenuListCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MenuListGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Menu List',
      apiUrl: '$baseUrl?',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Flutter-Flow': 'dawamraja',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  String? firstDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_day''',
      ));
  String? lastDay(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_day''',
      ));
  int? totDay(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.total_days''',
      ));
  String? month(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.month''',
      ));
  List<String>? daterangedate(dynamic response) => (getJsonField(
        response,
        r'''$.date_range[:].date''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? daterangeday(dynamic response) => (getJsonField(
        response,
        r'''$.date_range[:].day''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End Menu List Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
