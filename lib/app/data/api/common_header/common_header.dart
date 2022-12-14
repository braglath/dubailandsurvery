class Header {
  //? use commonHeaderCall on all api service
  static Future<Map<String, String>> commonHeader() async {
    // AndroidDeviceInfo androidInfo = await APIInstances.deviceInfoID.androidInfo;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      // 'Mobile': "iOS",
      // 'x-client-date': DateTime.now().toString(),
      // 'x-client-data': "3BA0C717-C412-43E4-8B99-E0CB2A7167EE"
    };
    return headers;
  }
}
