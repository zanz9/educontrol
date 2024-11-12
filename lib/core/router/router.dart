import 'package:educontrol/features/admin_panel/pages/admin_panel_page.dart';
import 'package:educontrol/features/auth/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'router_list.dart';
part 'router_paths.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

GoRouter routerProvider() {
  User? user = FirebaseAuth.instance.currentUser;
  final initialLocation =
      user == null ? RouterPaths.login : RouterPaths.adminPanel;

  final router = GoRouter(
    initialLocation: initialLocation,
    navigatorKey: routerKey,
    debugLogDiagnostics: true,
    routes: routes,
  );

  return router;
}
