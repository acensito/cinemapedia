import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.routeName,
      builder: (context, state) {
        final pageIndex = state.pathParameters['page'] ?? '0';

        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'movie/:movieId',
          name: MovieScreen.routeName,
          builder: (context, state) {
            final movieId = state.pathParameters['movieId'] ?? '';
            return MovieScreen(movieId: movieId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, _) {
        return '/home/0';
      },)
  ],
);
