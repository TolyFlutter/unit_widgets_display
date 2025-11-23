import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

void main() async {
  publishModule();
}

Future<void> publishModule() async {
  Directory dir = Directory.current;
  print(dir.path);
  await publish(dir.path, port: 7890);
}

Future<void> publish(String dir, {required int port}) async {
  Process process = await Process.start(
    workingDirectory: dir,
    'dart',
    ['pub', 'publish', '--server', 'https://pub.dartlang.org', '-f'],
    environment: {'https_proxy': 'http://127.0.0.1:$port'},
  );

  process.stdout.listen((e) {
    String value = utf8.decode(e, allowMalformed: true);
    print(value);
  });

  process.stderr.listen((e) {
    String value = utf8.decode(e, allowMalformed: true);
    print(value);
  });
}
