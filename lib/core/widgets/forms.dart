import 'package:flutter/material.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  
  final TextEditingController _formTitleController = TextEditingController();
  
  int _questionType = 1;
  int starCount = 5;

  bool _isRequired = true;

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
    for (final c in _singleChoiceControllers) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _buildAnswerByType() {
    switch (_questionType) {
      case 1:
        return _singleChoiceAnswer();
      case 2:
        return _multipleChoiceAnswer();
      case 3:
        return _ratingAnswer();
      case 4:
        return _textAnswer();
      default:
        return const SizedBox();
    }
  }
  
  List<TextEditingController> _singleChoiceControllers = [
    TextEditingController(),
  ];

  Widget _singleChoiceAnswer() {
    return Column(
      children: [
        ...List.generate(_singleChoiceControllers.length, (index) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 3),
            child: Row(
              children: [
                Image.asset('assets/images/form_radio_icon.png', height: 20,),
                SizedBox(width: 12,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: Color(0xff9CA3AF),
                        ),
                        onPressed: () {
                          setState(() {
                            _singleChoiceControllers[index].dispose();
                            _singleChoiceControllers.removeAt(index);
                          });
                        },
                      ),
                      hintText: "옵션",
                      hintStyle: TextStyle(fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE5E7EB), 
                          width: 0.7,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff164BC6),
                          width: 0.7,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _singleChoiceControllers.add(TextEditingController());
              });
            },
            child: Row(
              children: [
                Image.asset(
                  'assets/images/form_radio_icon.png',
                  height: 20,
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '옵션 추가',
                    style: TextStyle(
                      color: Color(0xff6A7282),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _multipleChoiceAnswer() {
    return Column(
      children: [
        ...List.generate(_singleChoiceControllers.length, (index) {
          return Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 3),
            child: Row(
              children: [
                Image.asset('assets/images/form_checkbox_icon.png', height: 18,),
                SizedBox(width: 12,),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 18,
                          color: Color(0xff9CA3AF),
                        ),
                        onPressed: () {
                          setState(() {
                            _singleChoiceControllers[index].dispose();
                            _singleChoiceControllers.removeAt(index);
                          });
                        },
                      ),
                      hintText: "옵션",
                      hintStyle: TextStyle(fontSize: 14),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffE5E7EB), 
                          width: 0.7,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff164BC6),
                          width: 0.7,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 2),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _singleChoiceControllers.add(TextEditingController());
              });
            },
            child: Row(
              children: [
                Image.asset('assets/images/form_checkbox_icon.png', height: 18,),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '옵션 추가',
                    style: TextStyle(
                      color: Color(0xff6A7282),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _ratingAnswer() {
    return Column(
      children: [
        SizedBox(height: 3,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            //starCount만큼 별 생성
            starCount,
            (index) => Flexible(
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Image.asset('assets/images/form_star.png', height: 32,)
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  if(starCount > 1){
                    starCount --;
                  }
                });
              },
              child: Image.asset('assets/images/form_star_minus_btn.png', height: 24,),
            ),
            SizedBox(width: 7),
            InkWell(
              onTap: (){
                setState((){
                  if(starCount < 10){
                    starCount ++;
                  }
                });
              },
              child: Image.asset('assets/images/form_star_plus_btn.png', height: 24,)
            ),
          ],
        )
      ],
    );
  }

  Widget _textAnswer() {
    return 
    Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 2),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text('텍스트 입력', style: TextStyle(color: Color(0xff6A7282), fontSize: 14,)),
              ),
            ],
          ),
          SizedBox(height: 12,),
          Divider(color: Color(0xffE5E7EB), thickness: 0.7, height: 0,),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 361,
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
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: "제목 없는 질문",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffE5E7EB), 
                        width: 0.65,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 173, 174, 176),
                        width: 0.65,
                      ),
                    ),
                  ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(11.49),
                    child: DropdownButton<int>(
                      value: _questionType,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: Image.asset(
                        'assets/images/form_dropdown_icon.png',
                        scale: 2.8,
                      ),
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(11.7),
                      itemHeight: 48.91,
                      menuWidth: 306,
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
                              Text('체크박스 질문 (다중 선택)', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a))),
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
                              Text('T', style: TextStyle(color: Color(0xffe5e7eb), fontWeight: FontWeight.bold, fontSize: 19, height: 0),),
                              SizedBox(width: 11,),
                              Text('주관식 질문', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xff0a0a0a))),
                            ]
                          )
                        ),
                      ], 
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _questionType = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                // 질문 유형에 따른 답변 형식 제공
                _buildAnswerByType(),
                SizedBox(height: 16,),
                Divider(color: Color(0xffe5e7eb), height: 0.65,),
                SizedBox(height: 15.88,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isRequired = !_isRequired;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 150),
                            width: 35, 
                            height: 20,
                            padding: EdgeInsets.symmetric(horizontal: 2.5),
                            decoration: BoxDecoration(
                              color: _isRequired
                                  ? Color(0xff164BC6)
                                  : Color(0xffE5E7EB),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: AnimatedAlign(
                              duration: Duration(milliseconds: 150),
                              alignment:
                                  _isRequired ? Alignment.centerRight : Alignment.centerLeft,
                              child: Container(
                                width: 14,
                                height: 14,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text('필수', style: TextStyle(color: Color(0xff333333)),)
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Color(0xff276CF7),
                              padding: EdgeInsets.fromLTRB(15, 12, 0, 12),
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
                              behavior: SnackBarBehavior.floating,
                              elevation: 0,
                              duration: Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),

                              content: Row(
                                children: [
                                  Image.asset('assets/images/form_snackbar_check_icon.png', width: 25,),
                                  SizedBox(width: 11,),
                                  Text('항목이 삭제되었습니다.', style: TextStyle(color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.w500),),
                                ],
                              )
                            )
                          );
                        });
                      },
                      child: Image.asset(
                        'assets/images/from_delete_icon.png',
                        height: 36,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20,)
      ],
    );
  }
}