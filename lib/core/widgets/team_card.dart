import 'package:flutter/material.dart';

class TeamCard extends StatefulWidget {
  final String initialText;

  const TeamCard({
    super.key,
    required this.initialText
  });

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  
  late final TextEditingController _controller;
  late final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10,),
      child: Container(
        // height: 55,
        decoration: BoxDecoration(
          color: Color(0xffFAFAFA),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _isFocused? Color(0xff2953B3) : Color(0xffCDCDCD),
            width: 1
          )
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 16),
          child: Row(
            children: [
              Image.asset(
                _isFocused ? 
                'assets/images/edit_team_enabled.png'
                : 'assets/images/edit_team_icon.png',
                width: 30,
              ),

              SizedBox(width: 9,),

              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}