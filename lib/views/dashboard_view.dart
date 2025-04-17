import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pulse_wave/viewmodel/dashboard_view_model.dart';
import 'package:pulse_wave/widgets/custom_dashboard_container_widget.dart';

class DashboardView extends StatelessWidget {
  final DashboardViewModel _viewModel = Get.put(DashboardViewModel());

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB8B8F0),Color(0xFFEEEEEE),Color(0xFFD2FFE8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 60,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 0.1).animate(
                CurvedAnimation(
                  parent: _viewModel.animationController,
                  curve: _viewModel.getRandomCurve(),
                ),
              ),
              child: Text(
                _viewModel.currentEmoji,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 110,
            child: Obx(() => Text(
                  ' ${_viewModel.typingText}',
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomDashboardContainerWidget(
                          text: 'General Commands',
                          imageUrl: 'GC',
                          borderColor: Colors.teal,
                          borderWidth: 2.0,
                          backgroundColor: Colors.pink,
                          onTap: () {
                            Get.toNamed('/general_commands_view');
                          },
                        ),
                        const SizedBox(width: 100),
                        CustomDashboardContainerWidget(
                          text: 'Master Commands',
                          imageUrl: 'MC',
                          borderColor: Colors.teal,
                          borderWidth: 2.0,
                          backgroundColor: Colors.purple,
                          onTap: () {
                            Get.toNamed('/master_commands_view',
                                arguments: {'index': 1});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomDashboardContainerWidget(
                          text: 'Cue Commands',
                          imageUrl: 'CC',
                          borderColor: Colors.teal,
                          borderWidth: 2.0,
                          backgroundColor: Colors.green,
                          onTap: () {
                            Get.toNamed('/cue_commands_view');
                          },
                        ),
                        const SizedBox(width: 100),
                        // CustomDashboardContainerWidget(
                        //   text: 'Custom Commands',
                        //   imageUrl: 'CC',
                        //   borderColor: Colors.teal,
                        //   borderWidth: 2.0,
                        //   backgroundColor: Colors.brown,
                        //   onTap: () {},
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
