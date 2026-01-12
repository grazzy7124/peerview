import 'package:flutter/material.dart';

class ClassChip extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  const ClassChip({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 320,
        height: 55,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isSelected
            ? const Color(0xffE0EAFF)
            : const Color(0xffFAFAFA),
          border: Border.all(
            color: isSelected
              ? const Color(0xff164BC6)
              : const Color(0xffCDCDCD),
            width: isSelected 
              ? 2 
              : 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isSelected
                    ? const Color(0xff164BC6)
                    : const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: SizedBox(
                    width: 14,
                    child: Image.asset('assets/images/check_icon.png'),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(title, style: const TextStyle( fontFamily: 'Pretendard', fontSize: 16, fontWeight: FontWeight.w600,),),
            ],
          ),
        ),
      ),
    );
  }
}
