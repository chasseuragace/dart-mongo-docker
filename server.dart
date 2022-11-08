// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, implicit_dynamic_list_literal

import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../main.dart' as entrypoint;
import '../routes/index.dart' as index;


void main() => createServer();

Future<HttpServer> createServer() async {
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final handler = Cascade().add(buildRootHandler()).handler;
  return entrypoint.run(handler, ip, port);
}

Handler buildRootHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..mount('/', (r) => buildHandler()(r));
  return pipeline.addHandler(router);
}

Handler buildHandler() {
  final pipeline = const Pipeline();
  final router = Router()
    ..all('/', index.onRequest);
  return pipeline.addHandler(router);
}
