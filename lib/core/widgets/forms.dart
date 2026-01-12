import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  
  final TextEditingController _formTitleController = TextEditingController();

  bool get _isFormComplete =>
      _formTitleController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _formTitleController.addListener(_onChanged);
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _formTitleController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 302,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffE5E7EB), width: 2),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 22.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Q1.', style: TextStyle(color: Color(0xff164Bc6), fontWeight: FontWeight.w500),),
            SizedBox(height: 8.28,),
            TextField(
              controller: _formTitleController,
              decoration: InputDecoration(
                hintText: "제목 없는 질문",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
              onChanged: (value) {
                setState(() {
                  
                });
              },
            ),
            SizedBox(height: 16),
            Container(
              width: 309,
              height: 48.91,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border.all(color: Color(0xffe5e7eb), width: 1.96),
                borderRadius: BorderRadius.circular(11.7)
              ),
              child: DropdownButton(
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.circular(11.7),
                itemHeight: 48.91,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Image.asset('assets/images/radio_btn_icon.png', width: 17,),
                        SizedBox(width: 11,),
                        Text('객관식 질문 (단일 선택)', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a)),),
                      ]
                    )
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Image.asset('assets/images/checkbox_icon.png', width: 17,),
                        SizedBox(width: 11,),
                        Text('주관식 질문 (다중 선택)', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a))),
                      ]
                    )
                  ),
                  DropdownMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Image.asset('assets/images/star_icon.png', width: 17,),
                        SizedBox(width: 11,),
                        Text('별점 질문', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a))),
                      ]
                    )
                  ),
                  DropdownMenuItem(
                    value: 4,
                    child: Row(
                      children: [
                        Text('T', style: TextStyle(color: Color(0xffe5e7eb), fontWeight: FontWeight.bold, fontSize: 19),),
                        SizedBox(width: 11,),
                        Text('주관식 질문', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a))),
                      ]
                    )
                  ),
                ], 
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}