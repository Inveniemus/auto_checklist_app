import 'package:flutter/material.dart';

class PhaseItemWidget extends StatelessWidget {
  final List<Widget> _children;

  const PhaseItemWidget._(this._children);

  factory PhaseItemWidget.challenge(String challenge, String response,
      [int indent = 0]) {
    return PhaseItemWidget._([
      SizedBox(
        width: indent * 5.0,
      ),
      Text(challenge),
      const Spacer(),
      Text(response)
    ]);
  }

  factory PhaseItemWidget.line([int indent = 0]) {
    return PhaseItemWidget._([
      const Divider(color: Colors.black, height: 20, thickness: 10,),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(3.0)),
        child: Row(
          children: _children,
        ));
  }
}
