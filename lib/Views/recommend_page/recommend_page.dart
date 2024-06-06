import 'package:flutter/material.dart';
import 'package:survey_app/constants.dart';
import '../home_page/home_page.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      Suggestion1,
      Suggestion2,
      Suggestion3,
      Suggestion4,
      Suggestion5,
      Suggestion6,
      Suggestion7
    ];
    final List<String> assetImagePaths = [
      recImg1,
      recImg2,
      recImg3,
      recImg4,
      recImg5,
      recImg6,
      recImg7,
    ];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(recommendation),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: screenHeight * 0.40,
              child: Image.asset(
                GeneralImg,
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: texts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          texts[index],
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          height: screenHeight * 0.25,
                          width: screenWidth,
                          child: Image.asset(
                            assetImagePaths[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
