import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:survey_app/constants.dart';
import '../recommend_page/recommend_page.dart';

class PieChartPage extends StatelessWidget {
  final double totalPercentage;
  const PieChartPage({Key? key, required this.totalPercentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double remainingPercentage = 100.0 - totalPercentage;

    // Define the message based on the remaining percentage
    String message = '';
    if (remainingPercentage < 50) {
      message =
          'Support is not meeting the minimum requirment of Go Green. Keep improving. We have general recommendations to avoid plastic usage.';
    } else if (remainingPercentage >= 50 && remainingPercentage < 80) {
      message =
          'You are a good supporter for Go Green. You are wonderful. Thank you and keep doing. We have general recommendations to avoid plastic usage.';
    } else {
      message =
          'You are an outstanding supporter for Go Green. Your role is very vital for future generations to avoid plastic usage.';
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(result),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.green,
                ),
                const SizedBox(width: 5),
                Text(
                  'Biodegradable',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 20,
                  height: 20,
                  color: Colors.black12,
                ),
                const SizedBox(width: 5),
                Text(
                  'Plastic',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: 300, // Specify a fixed width for the PieChart
                  height: 300, // Specify a fixed height for the PieChart
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: Colors.black12,
                          value: totalPercentage,
                          title:
                              '${totalPercentage.toStringAsFixed(2)}%', // Label for plastic usage
                          radius: 80,
                          showTitle: true, // Show title for this section
                        ),
                        PieChartSectionData(
                          color: Colors.green,
                          value: remainingPercentage,
                          title:
                              '${remainingPercentage.toStringAsFixed(2)}%', // Label for biodegradable usage
                          radius: 85,
                          showTitle: true, // Show title for this section
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      centerSpaceRadius: 40,
                      sectionsSpace: 0,
                      pieTouchData: PieTouchData(enabled: true),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Please click here',
                  style: TextStyle(color: Colors.grey),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const About()),
                    );
                  },
                  child: const Text(
                    recommendation,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
