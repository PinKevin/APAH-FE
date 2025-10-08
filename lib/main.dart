import 'package:asesmen_paud/pages/dashboard_page.dart';
import 'package:asesmen_paud/presentation/bindings/dashboard_binding.dart';
import 'package:asesmen_paud/presentation/bindings/initial_binding.dart';
import 'package:asesmen_paud/presentation/bindings/sign_in_binding.dart';
import 'package:asesmen_paud/presentation/pages/sign_in_page.dart';
import 'package:asesmen_paud/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

// final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
//     GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashPage()),
        GetPage(
          name: '/sign-in',
          page: () => const SignInPage(),
          binding: SignInBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => const DashboardPage(),
          binding: DashboardBinding(),
        ),
      ],
      // routes: {
      //   '/': (context) => FutureBuilder<bool>(
      //     future: _checkToken(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return const Scaffold(
      //           body: Center(child: CircularProgressIndicator()),
      //         );
      //       }

      //       if (snapshot.hasData && snapshot.data == true) {
      //         return const DashboardPage();
      //       } else {
      //         return const LoginPage();
      //       }
      //     },
      //   ),
      //   '/dashboard': (context) => const DashboardPage(),
      //   '/login': (context) => const LoginPage(),
      //   '/students': (context) => const StudentsPage(),
      //   '/create-student': (context) => const CreateStudentPage(),
      //   '/anecdotals': (context) => const AnecdotalsPage(),
      //   '/create-anecdotal': (context) => const CreateAnecdotalPage(),
      //   '/artworks': (context) => const ArtworksPage(),
      //   '/create-artwork': (context) => const CreateArtworkPage(),
      //   '/checklists': (context) => const ChecklistsPage(),
      //   '/create-checklist': (context) => const CreateChecklistPage(),
      //   '/series-photos': (context) => const SeriesPhotosPage(),
      //   '/create-series-photo': (context) => const CreateSeriesPhotoPage(),
      //   '/reports': (context) => const ReportsPage(),
      //   '/create-report': (context) => const CreateReportPage(),
      //   '/about': (context) => const AboutPage(),
      // },
    );
  }
}
