import 'package:clean_architecture/features/profile/presentation/pages/all_user_page.dart';
import 'package:clean_architecture/features/profile/presentation/pages/detail_user_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  GoRouter get router => GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: "all_user",
        pageBuilder: (context, state) => NoTransitionPage(child: AllUserPage()),
        routes: [
          GoRoute(
            path: "detail-user",
            name: "detail_user",
            pageBuilder: (context, state) =>
                NoTransitionPage(child: DetailUserPage()),
          ),
        ],
      ),
    ],
  );
}
