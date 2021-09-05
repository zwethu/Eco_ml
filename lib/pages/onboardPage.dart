
import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/route/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        dotsDecorator: DotsDecorator(
          activeColor: Colors.black,
        ),
        showSkipButton: true,
        showNextButton: true,
        showDoneButton: true,
        done: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Done',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        skip: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Skip',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        next: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Text(
            'Next',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
            ),
          ),
        ),
        onSkip: () {
          navigateToNameInputPage(context);
        },
        onDone: () {
          navigateToNameInputPage(context);
        },
        pages: [
          PageViewModel(
            image: Image.asset('assets/images/onboard1.png'),
            titleWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Track your expenses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff607196),
                ),
              ),
            ),
            bodyWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'See exactly where your money is going',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff607196),
                ),
              ),
            ),
          ),
          PageViewModel(
            image: Image.asset('assets/images/onboard2.png'),
            titleWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Monitor your income and expenses',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff6EBEA7),
                ),
              ),
            ),
            bodyWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Add your expenses and income to see how you spend your money and how your cash come in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff6EBEA7),
                ),
              ),
            ),
          ),
          PageViewModel(
            image: Image.asset('assets/images/onboard3.png'),
            titleWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Save your money',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xffFE5C83),
                ),
              ),
            ),
            bodyWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Saving your money for your goals and your future plans',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xffFE5C83),
                ),
              ),
            ),
          ),
          PageViewModel(
            image: Image.asset('assets/images/onboard4.png'),
            titleWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Daily and Category Analysis',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0xff9E8FAE),
                ),
              ),
            ),
            bodyWidget: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                'Analyse datas and show how your daily expenses differ with graphs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff9E8FAE),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void navigateToNameInputPage(BuildContext context){
  AutoRouter.of(context).push(NameInputRoute());
}
