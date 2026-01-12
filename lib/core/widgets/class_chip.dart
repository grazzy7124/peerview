import 'package:flutter/material.dart';

class ClassChip extends StatelessWidget {
  const ClassChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320, height: 55,
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0xffFAFAFA),
        border: BoxBorder.all(
          color: Color(0xffCDCDCD),
          width: 1
        ),
        borderRadius: BorderRadius.circular(100)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: [
            Container(
              width: 25, height: 25,
              decoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                borderRadius: BorderRadius.circular(100)
              ),
              child: Center(
                child: SizedBox(
                  width: 14,
                  child: Image.asset(
                    'assets/images/check_icon.png'
                  ),
                ),
              )
            ),
            SizedBox(width: 10,),
            Text(
              '공학설계입문',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontSize: 16,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}