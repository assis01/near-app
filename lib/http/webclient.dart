import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);



  const String x_api_key ='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpbiI6InN3ZG0iLCJwcm9qZXRvSWQiOiJlNmFiZjM0Yy05Y2M3LTQyZmMtODIyMy03ZWJiZWIxYTA3MzIiLCJpYXQiOjE1ODgzMDAxOTIsImV4cCI6MTU4ODM4NjU5Mn0.WAFDcTt453VT0JXSQ8ZFJQEv_jHY0yc3RSjDBM2rO7o';
  const String api_host='https://near-back.herokuapp.com/api/';