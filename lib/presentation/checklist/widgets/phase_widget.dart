import 'package:auto_checklist_app/domain/phase.dart';
import 'package:flutter/material.dart';

class PhaseWidget extends StatelessWidget {
  final Phase phase;

  const PhaseWidget(this.phase);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Text(
        phase.title,
        textScaleFactor: 1.5,
        style: const TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
