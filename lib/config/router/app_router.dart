import 'package:flutter_template/ui/screens/home_screen.dart';
import 'package:flutter_template/ui/screens/second_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // GoRoute(
    //   path: '/',
    //   name: HomeScreen.name,
    //   builder: (context, state) => const HomeScreen(),
    // ),
    GoRoute(
      path: '/',
      name: SecondPage.name,
      builder: (context, state) => const SecondPage(),
    )
  ],
);
