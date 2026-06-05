import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../screens/download/download_screen.dart';
import '../screens/contact/contact_screen.dart';
//import '../screens/privacy/privacy_policy_screen.dart';
//import '../screens/terms/terms_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', name: 'home', builder: (context, state) => const HomeScreen()),
    GoRoute(path: '/download', name: 'download', builder: (context, state) => const DownloadScreen()),
    GoRoute(path: '/contact', name: 'contact', builder: (context, state) => const ContactScreen()),
  ],
);
