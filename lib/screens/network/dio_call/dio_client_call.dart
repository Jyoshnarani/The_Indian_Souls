import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_indian_souls/screens/network/dio_call/dio_error_util.dart';

class DioClientCall {
  Dio dio = Dio();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        }
        if (response.statusCode == 400) {
          return "Unexpected error occurred : ${response.statusCode}";
        }
        if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return "Unexpected error occurred : ${response.statusCode}";
        } else {
          return "Unexpected error occurred : ${response.statusCode}";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        if (response.statusCode == 200  || response.statusCode == 201) {
          return response.data;
        }
        if (response.statusCode == 400) {
          return "Unexpected error occurred : ${response.statusCode}";
        }
        if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return "Unexpected error occurred : ${response.statusCode}";
        } else {
          return "Unexpected error occurred : ${response.statusCode}";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postLogout(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.post(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.data;
        }
        if (response.statusCode == 400) {
          return "Unexpected error occurred : ${response.statusCode}";
        }
        if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return "Unexpected error occurred : ${response.statusCode}";
        } else {
          return "Unexpected error occurred : ${response.statusCode}";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } catch (e) {
      rethrow;
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode != null) {
        if (response.statusCode == 200) {
          return response.data;
        }
        if (response.statusCode == 400) {
          return response.statusMessage;
        }
        if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return response.statusMessage;
        } else {
          return response.statusMessage;
        }
      } else {
        return response.statusMessage;
      }
    } catch (e) {
      rethrow;
    }
  }
}
