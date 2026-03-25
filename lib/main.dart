import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'providers/app_provider.dart';
import 'services/storage_service.dart';
import 'widgets/grid_background.dart';
import 'screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Status bar style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  // Init locale for Indonesian date formatting
  await initializeDateFormatting('id_ID', null);

  // Init storage
  final storage = StorageService();
  await storage.init();

  // Create provider
  final provider = AppProvider(storage);
  await provider.init();

  runApp(
    ChangeNotifierProvider.value(
      value: provider,
      child: const DzikirApp(),
    ),
  );
}

class DzikirApp extends StatelessWidget {
  const DzikirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Dzikir Pagi Petang',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.theme,
      builder: (context, child) {
        return Container(
          color: AppColors.white,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: GridPainter(
                    spacing: 28.0,
                    color: AppColors.black.withValues(alpha: 0.06),
                    strokeWidth: 1.0,
                  ),
                ),
              ),
              if (child != null)
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isTablet = constraints.maxWidth > 550;
                      return Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 550),
                          child: Container(
                            decoration: BoxDecoration(
                              border: isTablet
                                  ? const Border.symmetric(
                                      vertical: BorderSide(
                                        color: AppColors.black,
                                        width: 1.5,
                                      ),
                                    )
                                  : null,
                            ),
                            child: child,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
      home: const SplashScreen(),
    );
  }
}
