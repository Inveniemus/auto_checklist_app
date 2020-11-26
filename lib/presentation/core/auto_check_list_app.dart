import 'package:auto_checklist_app/domain/challenge.dart';
import 'package:auto_checklist_app/domain/check_list.dart';
import 'package:auto_checklist_app/domain/line.dart';
import 'package:auto_checklist_app/domain/phase.dart';
import 'package:auto_checklist_app/domain/response.dart';
import 'package:auto_checklist_app/presentation/checklist/check_list_page.dart';
import 'package:flutter/material.dart';

class AutoCheckListApp extends StatelessWidget {

  final exampleCheckList = CheckList(
      'NORMAL CHECKLIST',
      [
        Phase('BEFORE START', [
          Challenge('COCKPIT PREP', Response('COMPLETED (BOTH)')),
          Challenge('GEAR PINS AND COVERS', Response('REMOVED')),
          Challenge('SIGNS', Response('ON/AUTO')),
          Challenge('ADIRS', Response('NAV')),
          Challenge('FUEL QUANTITY', Response('____KG.LB')),
          Challenge('TO DATA', Response('SET')),
          Challenge('BARO REF', Response('____SET (BOTH)')),
          Line(),
          Challenge('WINDOWS/DOORS', Response('CLOSED (BOTH)')),
          Challenge('BEACON', Response('ON')),
          Challenge('THR LEVERS', Response('IDLE')),
          Challenge('PARKING BRAKE', Response('AS RQRD')),
        ]),
        Phase('AFTER START', [
          Challenge('ANTI ICE', Response('AS RQRD')),
          Challenge('ECAM STATUS', Response('CHECKED')),
          Challenge('PITCH TRIM', Response('____CHECK')),
          Challenge('RUDDER TRIM', Response('ZERO')),
        ]),

      ]
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light().copyWith(primaryColor: Colors.amber),
        home: CheckListPage(exampleCheckList),
    );
  }
}
