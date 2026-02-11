import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/team_card.dart';

class EditTeamPage extends StatefulWidget {
  const EditTeamPage({super.key});

  @override
  State<EditTeamPage> createState() => _EditTeamPageState();
}

class _EditTeamPageState extends State<EditTeamPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 15, right: 12),
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
              height: 300, 
              // height: 375,
              child: Scrollbar(
                controller: _scrollController,
                radius: Radius.circular(10),
                thickness: 8,
                interactive: false,
                thumbVisibility: true,
                trackVisibility: true,
                
            
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 11),
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            TeamCard(initialText: 'Team1',),
                            TeamCard(initialText: 'Team2',),
                            TeamCard(initialText: 'Team3',),
                            TeamCard(initialText: 'Team4',),
                            TeamCard(initialText: 'Team5',),
                            TeamCard(initialText: 'Team6',),
                            TeamCard(initialText: 'Team7',),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: IgnorePointer(
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(255, 255, 255, 0.0),
                                Color.fromRGBO(255, 255, 255, 0.9),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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

