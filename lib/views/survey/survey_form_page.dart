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
      appBar: 
        PreferredSize(
          preferredSize: Size.fromHeight(80), 
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 9),
                    fixedSize: Size(58, 35),
                    backgroundColor: _isFormComplete
                        ? const Color(0xff164BC6)
                        : const Color(0xffE5E7EB),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Center(child: Text('해당 설문을 등록하시겠습니까?', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, ),)),
                      actions: <Widget>[
                        TextButton(
                          style: ButtonStyle(
                            // backgroundColor: Color(0xffb4b4b4),
                            
                          ),
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text('아니요', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (_) => const CreateSurveyCompletePage(),
                              ),
                            );
                          },
                          child: Text('네', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffffffff), fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                  child: Text(
                    '등록',
                    style: TextStyle(
                      color: _isFormComplete
                          ? Colors.white
                          : const Color(0xff9CA3AF),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          spreadRadius: 0,
                          blurRadius: 9.4,
                          offset: Offset(0, 2),
                        )
                      ],
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11),
                      child: Image.asset(
                        'assets/images/plus_icon.png',
                      ),
                    ),
                  ),
                ),
              ),
            ]
          )
        )
      ),
    );
  }
}