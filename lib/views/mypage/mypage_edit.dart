import 'package:flutter/material.dart';

class MypageEdit extends StatefulWidget {
  const MypageEdit({super.key});

  @override
  State<MypageEdit> createState() => _MypageEditState();
}

class _MypageEditState extends State<MypageEdit> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _deptController = TextEditingController();

  bool get _isComplete =>
      _nameController.text.isNotEmpty &&
      _emailController.text.isNotEmpty &&
      _deptController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_onChanged);
    _emailController.addListener(_onChanged);
    _deptController.addListener(_onChanged);
  }

  void _onChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _deptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        title: Text('내 정보 수정', style: TextStyle(color: Color(0xff222222), fontWeight: FontWeight.w600, fontSize: 16),),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 37, 24, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('이름', style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 16),),
                    SizedBox(height: 9,),
                    SizedBox(
                      width: 345,
                      height: 48,
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: '김교수',
                          hintStyle: TextStyle(color: Color(0xff858585), fontWeight: FontWeight.w400, fontSize: 14, ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff595959),
                              width: 0.67,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff164BC6),
                              width: 0.67,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 21,),
                    Text('이메일', style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 16),),
                    SizedBox(height: 9,),
                    SizedBox(
                      width: 345,
                      height: 48,
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'kgsuu@handong.ac.kr',
                          hintStyle: TextStyle(color: Color(0xff858585), fontWeight: FontWeight.w400, fontSize: 14, ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff595959),
                              width: 0.67,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff164BC6),
                              width: 0.67,
                            ),
                          ),
                        ),
                      ),
                    ),              SizedBox(height: 21,),
                    Text('학부', style: TextStyle(color: Color(0xff000000), fontWeight: FontWeight.w600, fontSize: 16),),
                    SizedBox(height: 9,),
                    SizedBox(
                      width: 345,
                      height: 48,
                      child: TextField(
                        controller: _deptController,
                        decoration: InputDecoration(
                          hintText: '전산전자공학부',
                          hintStyle: TextStyle(color: Color(0xff858585), fontWeight: FontWeight.w400, fontSize: 14, ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff595959),
                              width: 0.67,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0xff164BC6),
                              width: 0.67,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: _isComplete 
                ? () {
                    
                  } 
                : null,
                style: TextButton.styleFrom(
                  backgroundColor: _isComplete
                      ? const Color(0xff164BC6)
                      : const Color(0xffE5E7EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('저장하기', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                  color: _isComplete
                      ? Colors.white
                      : const Color(0xff9ca3af),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}