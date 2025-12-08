import 'package:app_news_flutter/presentation/dashboard/widgets/card_corrective_machine.dart';
import 'package:app_news_flutter/presentation/dashboard/widgets/card_spare_part_usage.dart';
import 'package:app_news_flutter/presentation/dashboard/widgets/card_trouble_by_area.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardCorrectiveMachine(),
        CardTroubleByArea(),
        CardSparePartUsage(),
      ],
    );
  }
}
