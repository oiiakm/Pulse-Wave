import 'package:get/get.dart';
import 'package:pulse_wave/routes/route_error.dart';
import 'package:pulse_wave/views/master_commands_view.dart';
import 'package:pulse_wave/views/cue_commands_view.dart';
import 'package:pulse_wave/views/navigation_view.dart';
import 'package:pulse_wave/views/general_commands_view.dart';
import 'package:pulse_wave/views/splash_view.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: '/', page: () => SplashView()),
    GetPage(name: '/route_error', page: () => const RouteErrorView()),
    GetPage(name: '/navigation_view', page: () => NavigationView()),
    GetPage(name: '/general_commands_view', page: () => GeneralCommandsView()),
    GetPage(name: '/cue_commands_view', page: () => CueCommandsView()),
    GetPage(name: '/master_commands_view', page: () => MasterCommandsView()),
  ];
}
