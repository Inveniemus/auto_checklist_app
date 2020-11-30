import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/condition.dart';
import 'package:auto_checklist_app/domain/line.dart';
import 'package:auto_checklist_app/domain/message.dart' show Message;
import 'package:auto_checklist_app/domain/phase.dart';
import 'package:auto_checklist_app/domain/phase_item.dart';
import 'package:auto_checklist_app/presentation/checklist/widgets/phase_item_widgets.dart';
import 'package:flutter/material.dart';

class PhaseWidget extends StatelessWidget {
  final Phase phase;

  const PhaseWidget(this.phase);

  List<Widget> _buildColumnChildren() {
    final widgetList = <Widget>[];
    widgetList.add(Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          border: Border.all(),
          borderRadius: BorderRadius.circular(10)),
      child: Text(
        phase.title,
        textScaleFactor: 1.5,
        style:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    ));

    widgetList.addAll(phase.items.map((item) {
      if (item is Challenge) {
        return PhaseItemWidget.challenge(
            item.value, item.response.value, item.indentLength);
      } else if (item is Line) {
        return PhaseItemWidget.line(item.indentLength);
      }
      return const Text('???');
    }));

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildColumnChildren(),
    );
  }
}
