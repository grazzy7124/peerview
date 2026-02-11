import 'package:flutter/material.dart';
import 'package:peerview/views/auth/login_page.dart';
import 'package:peerview/views/auth/role_page.dart';
import 'package:peerview/views/home/home_page.dart';
import 'package:peerview/views/navigation.dart';
import 'package:provider/provider.dart';
import 'package:peerview/viewmodels/session_view_model.dart';

class GatePage extends StatelessWidget {
  const GatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<SessionViewModel>();

    if (vm.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    switch (vm.entry) {
      case EntryRoute.login:
        return const LoginPage();
      case EntryRoute.role:
        return const RolePage();
      case EntryRoute.adminHome:
        return const AdminNavigation();
      case EntryRoute.studentHome:
        return const AdminNavigation();
    }
  }
}
