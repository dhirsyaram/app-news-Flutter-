import 'package:app_news_flutter/data/models/corrective_data.dart';
import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardCorrectiveMachine extends StatelessWidget {
  const CardCorrectiveMachine({super.key});

  @override
  Widget build(BuildContext context) {
    final correctiveData = [
      CorrectiveData('Crane', 43),
      CorrectiveData('Hoist', 20),
      CorrectiveData('Spot Welding', 15),
      CorrectiveData('Air Dryer', 10),
      CorrectiveData('Compressor', 5),
      CorrectiveData('Feeder', 10),
    ];

    final correctiveColors = {
      'Crane': const Color(0xFFFF595E),
      'Hoist': const Color(0xFFFF924C),
      'Spot Welding': const Color(0xFFFFCA3A),
      'Air Dryer': const Color(0xFF8AC926),
      'Compressor': const Color(0xFF1982C4),
      'Feeder': const Color(0xFF6A4C93),
    };

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 28.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 1.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 18.0),
            _buildDropdownFilters(),
            const SizedBox(height: 12.0),
            SizedBox(
              height: 240,
              child: SfCircularChart(
                palette: correctiveColors.values.toList(),
                legend: const Legend(isVisible: false),
                tooltipBehavior: TooltipBehavior(enable: true),
                onTooltipRender: (TooltipArgs args) {
                  final label = args.text ?? '';
                  args.text = '$label%';
                },
                series: [
                  DoughnutSeries<CorrectiveData, String>(
                    dataSource: correctiveData,
                    xValueMapper: (data, _) => data.label,
                    yValueMapper: (data, _) => data.value,
                    dataLabelMapper: (data, _) => '${data.value}%',
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                    explode: true,
                    radius: '100%',
                    innerRadius: '55%',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            _buildLegendGrid(correctiveData, correctiveColors),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Corrective (Machine)",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Row(
            children: const [
              Text("View All", style: TextStyle(color: Colors.blue)),
              SizedBox(width: 4.0),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.0,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownFilters() {
    return Row(
      children: [
        Expanded(
          child: DropdownFlutter<String>(
            initialItem: "Building A",
            items: const ["Building A", "Building B"],
            onChanged: (val) => print("Gedung: $val"),
            hintText: "Pilih Gedung",
            headerBuilder: _dropdownText,
            decoration: _dropdownDecoration,
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: DropdownFlutter<String>(
            initialItem: "2024",
            items: const ["2024", "2025"],
            onChanged: (val) => print("Tahun: $val"),
            hintText: "Pilih Tahun",
            headerBuilder: _dropdownText,
            decoration: _dropdownDecoration,
          ),
        ),
      ],
    );
  }

  Widget _dropdownText(BuildContext context, String item, bool isSelected) {
    return Text(item, style: const TextStyle(fontWeight: FontWeight.w400));
  }

  CustomDropdownDecoration get _dropdownDecoration => CustomDropdownDecoration(
    closedFillColor: Colors.white,
    expandedFillColor: Colors.white,
    closedBorder: Border.all(color: Colors.blueGrey, width: 1.5),
    expandedBorder: Border.all(color: Colors.blue, width: 2),
    closedSuffixIcon: const Icon(Icons.expand_more_rounded),
    closedBorderRadius: BorderRadius.circular(8),
    expandedBorderRadius: BorderRadius.circular(8),
  );

  Widget _buildLegendGrid(
    List<CorrectiveData> items,
    Map<String, Color> colorMap,
  ) {
    final columns = _splitIntoColumns(items, 3);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columns.map((column) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: column.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: colorMap[item.label] ?? Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(item.label, style: const TextStyle(fontSize: 14)),
                ],
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  List<List<CorrectiveData>> _splitIntoColumns(
    List<CorrectiveData> items,
    int itemsPerColumn,
  ) {
    final columns = <List<CorrectiveData>>[];
    for (int i = 0; i < items.length; i += itemsPerColumn) {
      final end = (i + itemsPerColumn < items.length)
          ? i + itemsPerColumn
          : items.length;
      columns.add(items.sublist(i, end));
    }
    return columns;
  }
}
