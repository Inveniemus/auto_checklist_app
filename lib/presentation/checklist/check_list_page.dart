import 'package:auto_checklist_app/domain/check_list.dart';
import 'package:auto_checklist_app/presentation/checklist/widgets/phase_widget.dart';
import 'package:flutter/material.dart';

/// A Check-list page contains
class CheckListPage extends StatelessWidget {
  final CheckList checklist;

  const CheckListPage(this.checklist);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(checklist.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(height: 5.0,),
              itemCount: checklist.phases.length,
              itemBuilder: (context, index) =>
                  PhaseWidget(checklist.phases[index])),
        ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            Icon(Icons.replay, size: 50, color: Colors.amber,),
            Icon(Icons.play_arrow, size: 50, color: Colors.blue,),
            Spacer()
          ],
        ),
      ),
    );
  }
}
