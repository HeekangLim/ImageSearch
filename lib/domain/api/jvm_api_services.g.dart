// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jvm_api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _JvmApiServices implements JvmApiServices {
  _JvmApiServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dapi.kakao.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<ResSearchImage>> searchImage(
    token,
    query,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'query': query};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<ResSearchImage>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v2/search/image',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResSearchImage.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
