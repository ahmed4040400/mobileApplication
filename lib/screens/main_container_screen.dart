import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tabebak/screens/chatbot_screen.dart';
import 'package:tabebak/screens/doctor_list_screen.dart';
import 'package:tabebak/screens/patient_profile_screen.dart';
import 'package:tabebak/screens/team_screen.dart';  // Added import for TeamScreen
import '../controllers/auth_controller.dart';
import '../models/user_model.dart';
import 'home_screen.dart';

class MainContainerScreen extends StatefulWidget {
  const MainContainerScreen({Key? key}) : super(key: key);

  @override
  State<MainContainerScreen> createState() => _MainContainerScreenState();
}

class _MainContainerScreenState extends State<MainContainerScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(tabController: _controller),
      const DoctorListScreen(),
      const ChatbotScreen(),
      const PatientProfileScreen(),
      const TeamScreen(),  // Added TeamScreen to the list of screens
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.local_hospital),
        title: "Doctors",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.chat),
        title: "Chat",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Profile",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.people),
        title: "Team",
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),  // Added new nav item for Team
    ];
  }

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    return Obx(() {
      final user = authController.currentUser.value;

      if (authController.isLoading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      if (user == null) {
        Future.delayed(Duration.zero, () => Get.offAllNamed('/login'));
        return Container();
      }

      // Remove the role-based navigation logic that was causing redirection
      // Only redirect admins and doctors to their specific dashboards
      if (user.role == UserRole.admin) {
        Future.delayed(Duration.zero, () => Get.offAllNamed('/admin'));
        return Container();
      } else if (user.role == UserRole.doctor) {
        Future.delayed(
          Duration.zero,
          () => Get.offAllNamed('/doctor-dashboard'),
        );
        return Container();
      }

      // For patients, show the main container - don't redirect to patient-profile
      return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        // hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        navBarStyle: NavBarStyle.style9,
      );
    });
  }
}
