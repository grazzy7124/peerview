import 'package:flutter/material.dart';

class EditTeamPage extends StatelessWidget {
  const EditTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 89,),
            Text(
              '팀 인원 수 및 이름을 수정해주세요',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22
              ),
            ),
            SizedBox(height: 60,),
            SizedBox(
              height: 250, 
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                      TeamCard(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 28,),
            Material(
              color: Colors.transparent,
              child: Ink(
                width: 40, height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff164BC6),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    
                  },
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  const TeamCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 322, height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2), color: const Color.fromARGB(30, 0, 0, 0))
          ]
        ),
        child: Center(child: Text('data')),
      ),
    );
  }
}