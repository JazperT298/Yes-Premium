import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:get/get.dart';

class HomeApi {
  static var client = http.Client();
}
