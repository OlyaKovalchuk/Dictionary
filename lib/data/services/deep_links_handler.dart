import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:dictionary/main.dart';

class DeepLinksHandler {
  final _appLinks = AppLinks();

  Future<void> getInitialAppLink() async {
    final uri = await _appLinks.getInitialAppLink();
    logger.i(uri);
  }

  Stream<Uri> getLinksStream() => _appLinks.allUriLinkStream;
}
