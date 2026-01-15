import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/alertDialog.dart';
import 'package:peerview/views/class/class_page.dart';

class ClassCard extends StatelessWidget {
  const ClassCard({
    super.key,
    required this.className,
    required this.headCount,
    // required this.onEdit, 
    // required this.onDelete
  });

  final String className;
  final int headCount;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClassPage(className: className),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(47, 0, 0, 0),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              className,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),

                          PopupMenuButton<String>(
                            onSelected: (value) {
                              if (value == 'delete') {
                                showCustomedDialog(
                                  context,
                                  '정말로 삭제하시겠습니까?',
                                  (){}
                                );
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem<String>(
                                height: 30, 
                                value: 'delete',
                                child: Center(
                                  child: Text(
                                    '삭제하기',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            offset: Offset(0, 20),
                            color: Colors.white,
                            child: Container(
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: Image.asset(
                                  'assets/images/hamburger_icon.png',
                                ),
                              ),
                            ),
                          ),


                          // Image.asset(
                          //   'assets/images/hamburger_icon.png',
                          //   height: 15,
                          // ),
                        ],
                      ),
                      Text(
                        '${headCount.toString()}명',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Color(0xff777777),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
