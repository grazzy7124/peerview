import 'package:flutter/material.dart';
import 'package:peerview/views/class/class_list_page.dart';
import 'package:peerview/views/class/class_page.dart';
import 'package:peerview/views/home/home_page.dart';
import 'package:peerview/views/mypage/mypage.dart';
import 'package:peerview/views/survey/survey_pick_class_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  final _navigatorKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());

  void _onItemTapped(int index) {
    // 같은 탭을 다시 누르면 해당 탭의 스택을 루트까지 pop (선택)
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
      return;
    }

    setState(() => _selectedIndex = index);
  }

  Future<bool> _onWillPop() async {
    final nav = _navigatorKeys[_selectedIndex].currentState;

    if (nav != null && nav.canPop()) {
      nav.pop();
      return false;
    }

    // 현재 탭에서 더 이상 pop할 게 없으면, 홈 탭으로 이동 (선택)
    if (_selectedIndex != 0) {
      setState(() => _selectedIndex = 0);
      return false;
    }

    return true; // 앱 종료 허용
  }

  Route _onGenerateRoute(int tabIndex, RouteSettings settings) {
    late final Widget page;

    switch (tabIndex) {
      case 0: // 홈
        page = const HomePage();
        break;

      case 1: // 수업 탭 (여기서 /class 같은 상세 라우트 처리)
        switch (settings.name) {
          case '/':
            page = const ClassListPage();
            break;
          // case '/class':
          //   page = const ClassPage();
          //   break;
          default:
            page = const ClassListPage();
        }
        break;

      case 2: // 설문
        page = const SurveyPickClassPage();
        break;

      case 3: // 마이
        page = const Mypage();
        break;

      default:
        page = const HomePage();
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (settings) => _onGenerateRoute(index, settings),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: List.generate(4, (index) => _buildOffstageNavigator(index)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.group), label: '수업'),
            BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '설문'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이'),
          ],
        ),
      ),
    );
  }
}
