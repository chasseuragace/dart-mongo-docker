import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // 1. Execute any custom code prior to starting the server...
  await initdb();
  // 2. Use the provided `handler`, `ip`, and `port` to create a custom `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  return serve(handler, ip, port);
}

initdb() async {
  try {
    var db = Db("mongodb://mongo:27017/mongo_dart-blog");
    await db.open();

    print("Connected to db");
  } catch (e) {
    print("Erron on db connection $e");
  }
}
