import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wallet/const.dart';
import 'package:wallet/screens/transactionsScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          screenGradient(),
          topIcon(),
          card(context),
          blur(context),
          bottomContent(context)
        ],
      ),
    );
  }

  Positioned bottomContent(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Easy way to\nmanage money',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 90,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(27, 55, 90, 0.2),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => TransactionsScreen(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Get started',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Positioned topIcon() {
    return Positioned(
      top: 50,
      left: 20,
      child: Row(
        children: const [
          Icon(
            Icons.wallet,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Wallet',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Positioned blur(BuildContext context) {
    return Positioned(
      bottom: 0,
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container screenGradient() {
    return Container(
      width: double.infinity + 300,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            secondaryColor,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  Positioned card(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: -150,
      child: Transform.rotate(
        angle: -0.3,
        child: Image.asset(
          'assets/images/card.png',
          height: 300,
          width: 500,
        ),
      ),
    );
  }
}
