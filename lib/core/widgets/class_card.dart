import 'package:flutter/material.dart';
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
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) => AlertDialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    contentPadding: EdgeInsets.only(top: 36, bottom: 36),
                                    buttonPadding: EdgeInsets.all(0),
                                    insetPadding: EdgeInsets.all(58),
                                    iconPadding: EdgeInsets.all(0),
                                    titlePadding: EdgeInsets.all(0),
                                    actionsPadding: EdgeInsets.only(left: 16, right: 16, bottom: 13),
                                    content: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          '해당 설문을 삭제하시겠습니까?',
                                          style: TextStyle(
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      Row(
                                        children: <Widget>[
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: WidgetStatePropertyAll(Color(0xffB4B4B4)),
                                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)
                                              )),
                                              fixedSize: WidgetStatePropertyAll(Size(114, 39))
                                            ),
                                            onPressed: () => Navigator.pop(context, 'Cancel'),
                                            child: const Text(
                                              '아니요',
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Container()),
                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor: WidgetStatePropertyAll(Color(0xff164BC6)),
                                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8)
                                              )),
                                              fixedSize: WidgetStatePropertyAll(Size(114, 39))
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context, 'OK');
                                              // widget.onDelete();
                                            },
                                            child: const Text(
                                              '네',
                                              style: TextStyle(
                                                color: Colors.white
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
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
