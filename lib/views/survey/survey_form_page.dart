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
  final List<Widget> _forms = [];

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
                  suffixIcon: IconButton(
                    icon:Image.asset(
                    'assets/images/form_title_edit_icon.png', 
                    scale: 2.8,
                    ),
                    onPressed: (){
                    
                    }
                  ),
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
              ),
              SizedBox(height: 20),
              Text('마감일을 설정하세요.', style: TextStyle(color: Color(0xff333333)),),
              TextField(
                controller: _surveyDateController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      'assets/images/form_calendar_icon.png',
                      scale: 2.8,
                    ),
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2030),
                        
                      );
                      if (selectedDate != null) {
                        _surveyDateController.text =
                            '${selectedDate.year}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.day.toString().padLeft(2, '0')}';
                      }
                    },
                  ),
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
              Column(
                children: _forms,
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _forms.add(const Forms());
                  });
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff2A71FF), Color(0xff164BC6)],
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        'assets/images/form_add_btn_icon.png',
                        height: 28,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 119,),
              Container(
                width: 335,
                height: 50,
                decoration: BoxDecoration(
                  color: _isFormComplete
                      ? const Color(0xff164BC6)
                      : const Color(0xffE5E7EB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: _isFormComplete
                    ? () {
                        //
                      }
                    : null,
                  child: Text(
                    '등록하기',
                    style: TextStyle(
                      color: _isFormComplete
                          ? const Color(0xffffffff)
                          : const Color(0xff9ca3af),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // jjjjj
                ),
              ),
              SizedBox(height: 33),
            ]
          )
        )
      )
    );
  }
}