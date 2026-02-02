import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:peerview/viewmodels/session_view_model.dart';

class GatePage extends StatefulWidget {
  const GatePage({super.key});

  @override
  State<GatePage> createState() => _GatePageState();
}

class _GatePageState extends State<GatePage> {
  EntryRoute? _lastEntry;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionViewModel>(
      builder: (context, vm, _) {
        debugPrint('Gate: loading=${vm.isLoading}, entry=${vm.entry}, error=${vm.error}');

        if (vm.isLoading) {
          _lastEntry = null;
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (_lastEntry != vm.entry) {
          _lastEntry = vm.entry;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            switch (vm.entry) {
              case EntryRoute.login:
                Navigator.pushReplacementNamed(context, '/login');
                break;
              case EntryRoute.role:
                Navigator.pushReplacementNamed(context, '/role');
                break;
              case EntryRoute.adminHome:
                Navigator.pushReplacementNamed(context, '/adminHome');
                break;
              case EntryRoute.studentHome:
                Navigator.pushReplacementNamed(context, '/studentHome');
                break;
            }
          });
        }

        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}
