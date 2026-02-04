import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';
import 'package:peerview/views/class/create_class_complete_page.dart';

class CreateClassPage extends StatefulWidget {
  const CreateClassPage({super.key});

  @override
  State<CreateClassPage> createState() => _CreateClassPageState();
}

class _CreateClassPageState extends State<CreateClassPage> {
  final TextEditingController _classNameController = TextEditingController();
  final TextEditingController _studentCountController = TextEditingController();
  final TextEditingController _teamCountController = TextEditingController();

  bool get _isFormComplete =>
      _classNameController.text.isNotEmpty &&
      _studentCountController.text.isNotEmpty &&
      _teamCountController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _classNameController.addListener(_onChanged);
    _studentCountController.addListener(_onChanged);
    _teamCountController.addListener(_onChanged);
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _classNameController.dispose();
    _studentCountController.dispose();
    _teamCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '수업을 생성하세요!',
                  style: FontStyles.classFormTitle,
                ),
                const SizedBox(height: 40),
      
                Text('수업 이름을 입력하세요', style: FontStyles.classFormBody1),
                TextField(controller: _classNameController),
      
                const SizedBox(height: 32),
      
                Text('수강자 인원 수', style: FontStyles.classFormBody1),
                TextField(
                  controller: _studentCountController,
                  keyboardType: TextInputType.number,
                ),
      
                const SizedBox(height: 32),
      
                Text('팀 수', style: FontStyles.classFormBody1),
                TextField(
                  controller: _teamCountController,
                  keyboardType: TextInputType.number,
                ),
      
                const SizedBox(height: 32),
      
                Text('코드 생성', style: FontStyles.classFormBody1),
                const SizedBox(height: 12),
      
                Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                    border: Border.all(
                      color: const Color(0xffE5E7EB),
                      width: 1.96,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: const Center(
                    child: Text(
                      '생성된 코드가 여기에 표시됩니다',
                      style: TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xff9CA3AF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity, height: 48,
                        decoration: BoxDecoration(
                          color: Color(0xff164BC6),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Center(
                          child: Text(
                            '코드 생성하기',
                            style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Container(
                      width: 71, height: 48,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.96,
                          color: Color(0xffE5E7EB)
                        ),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 20,
                          child: Image.asset(
                            'assets/images/copy_icon.png',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
      
                const SizedBox(height: 16),
      
                /// ✅ 완료 버튼
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: _isFormComplete
                          ? () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => CreateClassCompletePage(className: _classNameController.text,)
                                )
                              );
                            }
                          : null,
                      child: Container(
                        width: 120,
                        height: 48,
                        decoration: BoxDecoration(
                          color: _isFormComplete
                              ? const Color(0xff164BC6)
                              : const Color(0xffE5E7EB),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '완료',
                                style: TextStyle(
                                  color: _isFormComplete
                                      ? Colors.white
                                      : const Color(0xff9CA3AF),
                                ),
                              ),
                              const SizedBox(width: 7),
                              Image.asset(
                                'assets/images/arrow_right_icon.png',
                                width: 20,
                                color: _isFormComplete
                                    ? Colors.white
                                    : const Color(0xff9CA3AF),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
