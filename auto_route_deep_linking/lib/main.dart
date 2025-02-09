// lib/main.dart
import 'package:auto_route_deep_linking/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_route/auto_route.dart';
import 'router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(
        // Transform deep links before they're processed
        deepLinkTransformer: (uri) {
          // Example: Strip a 'mobile' prefix from the path
          if (uri.path.startsWith('/mobile')) {
            return SynchronousFuture(
              uri.replace(path: uri.path.replaceFirst('/mobile', '')),
            );
          }
          return SynchronousFuture(uri);
        },

        // Validate or override incoming deep links
        deepLinkBuilder: (deepLink) {
          // Only allow deep links starting with /products or /
          if (deepLink.path.startsWith('/products') || deepLink.path == '/') {
            return deepLink;
          }

          // Redirect all other deep links to home
          return const DeepLink([HomeRoute()]);
        },
      ),
      title: 'Advanced Deep Linking Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}
