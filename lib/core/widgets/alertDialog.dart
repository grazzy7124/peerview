import 'package:flutter/material.dart';

Future<String?> showCustomedDialog(BuildContext context, String content, VoidCallback delete) {


    return showDialog<String>(
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
            Text(
              content,
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
                  delete();
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