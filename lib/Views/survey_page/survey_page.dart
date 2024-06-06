import 'package:flutter/material.dart';
import 'package:survey_app/Views/home_page/home_page.dart';
import 'package:survey_app/constants.dart';

import '../Widgets/pie_chart.dart';
import '../Widgets/question.dart';

class Survey extends StatelessWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(survey),
        leading: BackButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text(
                  'Quit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                content: const Text('Are you sure???'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      body: const QuestionCard(),
    );
  }
}

class QuestionCard extends StatefulWidget {
  const QuestionCard({Key? key}) : super(key: key);

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  List<int> selectedOptions = [1, 1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Question(
          question: question1,
          options: const ['5', '1', 'None'],
          onOptionSelected: (index) {
            setState(() {
              selectedOptions[0] = index;
            });
          },
        ),
        Question(
          question: question2,
          options: const ['2', '1', 'None'],
          onOptionSelected: (index) {
            setState(() {
              selectedOptions[1] = index;
            });
          },
        ),
        Question(
          question: question3,
          options: const ['3', '2', 'None'],
          onOptionSelected: (index) {
            setState(() {
              selectedOptions[2] = index;
            });
          },
        ),
        Question(
          question: question4,
          options: const ['3 to 4 times in a week', 'Once in a month', 'None'],
          onOptionSelected: (index) {
            setState(() {
              selectedOptions[3] = index;
            });
          },
        ),
        Question(
          question: question5,
          options: const ['Never', 'Monthly once', 'Weekly once'],
          onOptionSelected: (index) {
            setState(() {
              selectedOptions[4] = index;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            _calculatePercentage();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _calculatePercentage() {
    double totalPercentage = 0.0;

    // Calculate percentage for each question
    for (int i = 0; i < selectedOptions.length; i++) {
      int option = selectedOptions[i];
      if (i == 0) {
        if (option == 1) {
          totalPercentage += 20.0;
        } else if (option == 2) {
          totalPercentage += 10.0;
        } else if (option == 3) {
          totalPercentage += 0.0;
        }
      } else if (i == 1) {
        if (option == 1) {
          totalPercentage += 20.0;
        } else if (option == 2) {
          totalPercentage += 10.0;
        } else if (option == 3) {
          totalPercentage += 0.0;
        }
      } else if (i == 2) {
        if (option == 1) {
          totalPercentage += 20.0;
        } else if (option == 2) {
          totalPercentage += 10.0;
        } else if (option == 3) {
          totalPercentage += 0.0;
        }
      } else if (i == 3) {
        if (option == 1) {
          totalPercentage += 20.0;
        } else if (option == 2) {
          totalPercentage += 10.0;
        } else if (option == 3) {
          totalPercentage += 0.0;
        }
      } else if (i == 4) {
        if (option == 1) {
          totalPercentage += 20.0;
        } else if (option == 2) {
          totalPercentage += 10.0;
        } else if (option == 3) {
          totalPercentage += 0.0;
        }
      }
    }

    print('Average Percentage: $totalPercentage');
    // You can perform further actions with the average percentage value here
    // Navigate to the pie chart page and pass the total percentage as a parameter
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PieChartPage(totalPercentage: totalPercentage),
      ),
    );
  }
}
