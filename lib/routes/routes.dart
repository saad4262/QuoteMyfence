import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:quotefence/controllers/form_controller.dart';
import 'package:quotefence/view/admin_dashboard.dart';
import 'package:quotefence/view/login_screen.dart';
import 'package:quotefence/view/onboarding_screen.dart';

final router = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(
      path: '/step/:id',
      builder: (context, state) {
        final stepId = int.tryParse(state.pathParameters['id'] ?? '1') ?? 1;
        final locationParam = state.uri.queryParameters['location'];
        final controller = Get.put(FormController());
        controller.initializeFromUrl(locationParam, stepId);
        return OnboardingScreen(stepId: stepId);
      },
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(
      path: '/admin/dashboard',
      builder: (context, state) {
        if (FirebaseAuth.instance.currentUser == null) {
          return const LoginScreen();
        }
        return const AdminDashboard();
      },
    ),
  ],
);
