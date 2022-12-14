import 'package:flutter/services.dart';
import 'package:landsurvey/app/data/config/server_config.dart';

import '../../models/total_property_count_model.dart';
import 'package:http/http.dart' as http;

import '../common_header/common_header.dart';

Future<TotalPropertyCountModel?> totalPropertyCountApi() async {
  final http.Client client = http.Client();
  final Uri url = Uri.http(ServerConfig.localServer, '/prop_type_count');
  print('totalPropertyCountApi url - $url');
  final Map<String, String> headers = await Header.commonHeader();
  try {
    final http.Response response = await client.get(url, headers: headers);
    print('totalPropertyCountApi response - ${response.body}');

    if (response.statusCode != 200) {
      return null;
    } else {
      final decodedRes = totalPropertyCountModelFromMap(response.body);
      return decodedRes;
    }
  } on http.ClientException catch (e) {
    print('totalPropertyCountApi error - ${e.message}');
    return null;
  } on PlatformException catch (e) {
    print('totalPropertyCountApi error - ${e.message}');
    return null;
  } catch (e) {
    print('totalPropertyCountApi error - $e');
    return null;
  } finally {
    client.close();
  }
}
