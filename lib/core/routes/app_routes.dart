import 'package:flutter/material.dart';
import 'package:peerview/views/auth/login_page.dart';
import 'package:peerview/views/auth/role_page.dart';
import 'package:peerview/views/class/class_page.dart';
import 'package:peerview/views/home/home_page.dart';
import 'package:peerview/views/navigation.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/role': (context) => RolePage(),
    '/' : (context) => Navigation(),
    // '/class': (context) => ClassPage(),

  };
}
