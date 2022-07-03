// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(seconds: 2), upperBound: 80);
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/welcomescreenpic.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      Hero(
                        tag: 'logo',
                        child: Container(
                            child: Image.asset('images/logo.png'),
                            height: controller.value),
                      ),
                      TypewriterAnimatedTextKit(
                        text: ['WhatsApp'],
                        textStyle: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.lightBlueAccent,
                        elevation: 5,
                        shadowColor: Colors.lightBlue,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'Login_screen');
                          },
                          minWidth: 150,
                          height: 42,
                          child: Text(
                            'Log in',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Material(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                        elevation: 5,
                        shadowColor: Colors.lightBlue,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'Registration_screen');
                          },
                          minWidth: 150,
                          height: 42,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
