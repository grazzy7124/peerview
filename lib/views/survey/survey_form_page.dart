import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/forms.dart';

class SurveyFormPage extends StatefulWidget {
  const SurveyFormPage({super.key});

  @override
  State<SurveyFormPage> createState() => _SurveyFormPageState();
}

class _SurveyFormPageState extends State<SurveyFormPage> {
  final TextEditingController _surveyTitleController = TextEditingController();
  final TextEditingController _surveyDateController = TextEditingController();

  bool get _isFormComplete =>
      _surveyTitleController.text.isNotEmpty &&
      _surveyDateController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _surveyTitleController.addListener(_onChanged);
    _surveyDateController.addListener(_onChanged);
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _surveyTitleController.dispose();
    _surveyDateController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TextField(
                controller: _surveyTitleController,
                decoration: InputDecoration(
                  suffixIcon: Image.asset('assets/images/form_title_edit_icon.png', scale: 2.8,),
                  hintText: "제목 없는 평가지",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE5E7EB), 
                      width: 1.96,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff164BC6),
                      width: 1.96,
                    ),
                  ),
                ),
                
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
              ),
              SizedBox(height: 20),
              Text('마감일을 설정하세요.', style: TextStyle(color: Color(0xff333333)),),
              TextField(
                controller: _surveyDateController,
                decoration: InputDecoration(
                  suffixIcon: Image.asset('assets/images/form_calendar_icon.png', scale: 2.8,),
                  hintText: "2026.01.01",
                  hintStyle: TextStyle(
                    color: Color(0xff9CA3AF),
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE5E7EB), 
                      width: 1.96,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff164BC6),
                      width: 1.96,
                    ),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
              ),
              SizedBox(height: 20),
              Forms(),
              SizedBox(height: 19,),
              GestureDetector(
                onTap: (){

                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff2A71FF), Color(0xff164BC6)]
                      ),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset('assets/images/form_add_btn_icon.png', height: 28,),
                    )
                  ),
                ),
              ),
              SizedBox(height: 119,),
              
            ]
          )
        )
      )
    );
  }
}