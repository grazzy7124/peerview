import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/forms.dart';
import 'package:peerview/views/survey/create_survey_complete_page.dart';

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
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 110), 
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
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
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color(0xff164BC6),
                                onPrimary: Colors.white,
                                onSurface: Color(0xff1A1A1A),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _surveyDateController.text =
                              "${selectedDate.year}.${selectedDate.month.toString().padLeft(2, '0')}.${selectedDate.day.toString().padLeft(2, '0')}";
                        });
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
            ]
          )
        )
      ),
       bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: _isFormComplete
                    ? const Color(0xff164BC6)
                    : const Color(0xffE5E7EB),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: _isFormComplete ? () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) => const CreateSurveyCompletePage(),
                  ),
                );
              } : null,
              child: Text(
                '등록하기',
                style: TextStyle(
                  color: _isFormComplete
                      ? Colors.white
                      : const Color(0xff9CA3AF),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}