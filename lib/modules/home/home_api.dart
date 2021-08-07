import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HomeApi {
  static var client = http.Client();

  static Future getEducatorDetails() async {
    var token =
        'Shxb90CfScC4n9V2Bw66MMzKtIklVWwlRuCWKOzLCW80kQh34b3oCm0O_iIhtSxg6oaQ_CYK2xdzzFHwqPw2tp7FSOJT5jnvwHCTvJ_STf1AlvSxri-WsnIjGRJgiizL8l0fWKt-nOsj_T2yHWFfqoMsSNIXRde0ACWWQDQROI0PX3fic16wSzCMf-eQD3w6aFYdvwqoUKKfiaFu5a0neoQbw4f0bUI250ujYY9WQhytJYgpSRuWrsCqOeYpD2BtVkjdoL9SkiJp6lwedVJIkljbJ4IntSFJAQiTbcsPGGXy8O4lotI11x21HqSl2ocRAWLr4WMJnKlZPXA9TU2seZI29NXxaUM_XiHKprB5n0jyWHQf8ah1ImtARm8Vi12_ZZ2zWFJXMD3HBHV1ao04t_dX2lbTY3jLF3H-wYpletYk5WjLWQA35zI7ztK6_PWku8k0MqR6JNRmM2XeLXq2i9Sk5L-1nYShAfZo9Tov8HBj2WjnzLDpiSppSvwFm4dqEwPBbuozweRUERA327Ow64zUsdqwZmn1ut4zzav3eOA';
    try {
      var response = await client.post(
        Uri.parse('https://yestechpremium.com:8080/api/Account/GetLocalInfo'),

        headers: {
          "access-control-allow-origin": "*",
          'content-type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
        },
        body: {},
        // encoding: Encoding.getByName('utf-8'),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              "getEducatorDetails Services Connection timeout.");
        },
      );
      print(response.body);
    } on TimeoutException catch (_) {
      print('getEducatorDetails Services Response timeout');
      return null;
    } on SocketException catch (_) {
      print('getEducatorDetails Services Socket error');
      return null;
    } catch (e) {
      print('getEducatorDetails Services  Err $e');
      return null;
    }
  }
}
