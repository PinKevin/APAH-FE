import 'package:asesmen_paud/presentation/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asesmen_paud/widget/dashboard/greeting.dart';
import 'package:asesmen_paud/widget/dashboard/menu_button.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  void _navigateToStudents(
    BuildContext context, {
    Map<String, dynamic>? arguments,
  }) {
    Navigator.pushNamed(context, '/students', arguments: arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: controller.signOut,
              icon: controller.isLoading.value
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2.0,
                      ),
                    )
                  : const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Greeting(teacherName: controller.teacherName.value)),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 20,
                childAspectRatio: 1,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
                children: [
                  MenuButton(
                    icon: Icons.create,
                    label: 'Anekdot',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'anecdotal'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.palette,
                    label: 'Hasil Karya',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'artwork'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.check,
                    label: 'Ceklis',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'checklist'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.camera_alt,
                    label: 'Foto Berseri',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'series-photo'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.article,
                    label: 'Laporan Bulanan',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'report'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.person,
                    label: 'Murid',
                    onPressed: () => _navigateToStudents(
                      context,
                      arguments: {'mode': 'student'},
                    ),
                  ),
                  MenuButton(
                    icon: Icons.info,
                    label: 'Tentang Aplikasi',
                    onPressed: () => Navigator.pushNamed(context, '/about'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
