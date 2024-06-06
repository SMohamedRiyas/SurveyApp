import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String question;
  final List<String> options;
  final ValueChanged<int> onOptionSelected;
  const Question({
    Key? key,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  }) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.question,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const SizedBox(height: 8.0),
          for (int i = 0; i < widget.options.length; i++)
            RadioListTile(
              value: i + 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value as int;
                  widget.onOptionSelected(value as int);
                });
              },
              fillColor:
                  MaterialStateColor.resolveWith((states) => Colors.green),
              title: Text(widget.options[i]),
            ),
          // ElevatedButton(
          //   onPressed: () {
          //     _calculatePercentage();
          //   },
          //   child: Text('Calculate Percentage'),
          // ),
        ],
      ),
    );
  }
}
