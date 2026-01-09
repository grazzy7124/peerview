import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 500,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(const Color.fromARGB(255, 228, 228, 228))
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                }, 
                child: Text('Login')
              )
            ],
          )
        ],
      ),
    );
  }
}