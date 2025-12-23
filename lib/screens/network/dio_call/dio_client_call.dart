import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else if (response.statusCode! == 400) {
          return response.data;
        } else if (response.statusCode! > 400 && response.statusCode! <= 499) {
          return "Client Error: ${response.statusCode} : ${response.statusMessage}";
        } else if (response.statusCode! >= 500 && response.statusCode! < 599) {
          return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
        } else {
          return "The request is being processed (Status code ${response.statusCode})";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (response.statusCode != null) {
          if (response.statusCode! == 400) {
            return response.data;
          } else if (response.statusCode! > 400 &&
              response.statusCode! <= 499) {
            return "Client Error: ${response.statusCode} : ${response.statusMessage}";
          } else if (response.statusCode! >= 500 &&
              response.statusCode! < 599) {
            return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
          } else {
            return "The request is being processed (Status code ${response.statusCode})";
          }
        }
      }
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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else if (response.statusCode! == 400) {
          return response.data;
        } else if (response.statusCode! > 400 && response.statusCode! <= 499) {
          return "Client Error: ${response.statusCode} : ${response.statusMessage}";
        } else if (response.statusCode! >= 500 && response.statusCode! < 599) {
          return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
        } else {
          return "The request is being processed (Status code ${response.statusCode})";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (response.statusCode != null) {
          if (response.statusCode! == 400) {
            return response.data;
          } else if (response.statusCode! > 400 &&
              response.statusCode! <= 499) {
            return "Client Error: ${response.statusCode} : ${response.statusMessage}";
          } else if (response.statusCode! >= 500 &&
              response.statusCode! < 599) {
            return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
          } else {
            return "The request is being processed (Status code ${response.statusCode})";
          }
        }
      }
      debugPrint(e.toString());
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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else if (response.statusCode! == 400) {
          return response.data;
        } else if (response.statusCode! > 400 && response.statusCode! <= 499) {
          return "Client Error: ${response.statusCode} : ${response.statusMessage}";
        } else if (response.statusCode! >= 500 && response.statusCode! < 599) {
          return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
        } else {
          return "The request is being processed (Status code ${response.statusCode})";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (response.statusCode != null) {
          if (response.statusCode! == 400) {
            return response.data;
          } else if (response.statusCode! > 400 &&
              response.statusCode! <= 499) {
            return "Client Error: ${response.statusCode} : ${response.statusMessage}";
          } else if (response.statusCode! >= 500 &&
              response.statusCode! < 599) {
            return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
          } else {
            return "The request is being processed (Status code ${response.statusCode})";
          }
        }
      }
      debugPrint(e.toString());
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
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else if (response.statusCode! == 400) {
          return response.data;
        } else if (response.statusCode! > 400 && response.statusCode! <= 499) {
          return "Client Error: ${response.statusCode} : ${response.statusMessage}";
        } else if (response.statusCode! >= 500 && response.statusCode! < 599) {
          return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
        } else {
          return "The request is being processed (Status code ${response.statusCode})";
        }
      } else {
        return "Unexpected error occurred : ${response.statusCode}";
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final response = e.response!;
        if (response.statusCode != null) {
          if (response.statusCode! == 400) {
            return response.data;
          } else if (response.statusCode! > 400 &&
              response.statusCode! <= 499) {
            return "Client Error: ${response.statusCode} : ${response.statusMessage}";
          } else if (response.statusCode! >= 500 &&
              response.statusCode! < 599) {
            return "Server Error: : ${response.statusCode} : ${response.statusMessage}";
          } else {
            return "The request is being processed (Status code ${response.statusCode})";
          }
        }
      }
      debugPrint(e.toString());
      rethrow;
    }
  }
}
