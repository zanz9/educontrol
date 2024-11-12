part of 'router.dart';

final routes = [
  GoRoute(
    path: RouterPaths.home,
    builder: (context, state) => const Scaffold(),
  ),
  GoRoute(
    path: RouterPaths.login,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: RouterPaths.adminPanel,
    builder: (context, state) => const AdminPanelPage(),
  ),
];
