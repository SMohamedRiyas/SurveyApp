import 'package:flutter/material.dart';
import 'package:survey_app/Views/survey_page/survey_page.dart';
import 'package:survey_app/constants.dart';
import '../awareness_page/awareness_page.dart';
import '../recommend_page/recommend_page.dart';
import 'package:survey_app/Views/Widgets/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: screenHeight * 0.8,
                    width: screenWidth * 0.29,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(homeImg),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 40.0),
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Info()),
                            );
                          },
                          label: awareness,
                        ),
                        const SizedBox(height: 40.0),
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Survey()),
                            );
                          },
                          label: survey,
                        ),
                        const SizedBox(height: 40.0),
                        CustomButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const About()),
                            );
                          },
                          label: recommendation,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Created by',
                style: TextStyle(
                  color: Colors.black12,
                  fontSize: 10,
                ),
              ),
              const Text(
                'Mohamed Aarif',
                style: TextStyle(
                    color: Colors.black12, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
