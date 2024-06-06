import 'package:flutter/material.dart';
import 'package:survey_app/constants.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      '1. Plastic creates a waste management problem',
      '2. Plastic pollution makes touristic areas unsightly',
      '3. Plastic pollution kills wildlife',
      '4. Micro-plastics pollute the soil',
      '5. Burning plastic can affect air quality, public health.',
    ];
    final List<String> assetImagePaths = [
      'images/Cause-1.jpg',
      'images/Cause-2.jpg',
      'images/Cause-3.jpg',
      'images/Cause-4.jpg',
      'images/Cause-5.png',
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(awareness),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Plastic pollution has become one of the major environmental issues these days. Plastic is manufactured in a variety of modes, which is just increasing the numbers every day. The major counts come from single-use plastic products and are challenging our ability to deal with these numbers.',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.25,
              child: Image.asset(
                'images/general.jpg',
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
