//FLUTTER NATIVE
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

//PAQUETS INSTALATS
import 'package:google_fonts/google_fonts.dart';
import 'package:max_count/src/models/hex_color.dart';

//SCREENS
import 'package:max_count/src/screens/screens.dart';
import 'package:max_count/src/widgets/circular_button.dart';
import 'package:max_count/src/widgets/route_animations/reveal_route.dart';
import 'package:max_count/src/widgets/status_bars.dart';

class Onboarding3 extends StatefulWidget {
  Function callback;

  Onboarding3({required this.callback});

  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double shortestSide = MediaQuery.of(context).size.shortestSide;

    return Scaffold(
      backgroundColor: HexColor.fromHex("#5ED466"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.025,
              ),
              StatusBars(
                  position: 3,
                  totalElements: 4,
                  selectedColor: Colors.black,
                  unselectedColor: Colors.black45),
              SizedBox(
                height: height * 0.025,
              ),
              AutoSizeText(
                "Max Count",
                style: TextStyle(
                    fontSize: shortestSide < 600 ? 50 : 80,
                    fontFamily: 'PixelTitle',
                    color: Colors.black),
                maxLines: 1,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText(
                    "Countdowns",
                    style: GoogleFonts.vt323(
                        textStyle: TextStyle(
                            fontSize: shortestSide < 600 ? 40 : 50,
                            fontWeight: FontWeight.bold)),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    "You get 15 submits every minute",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.vt323(
                        textStyle: TextStyle(
                            fontSize: shortestSide < 600 ? 25 : 30,
                            fontWeight: FontWeight.bold)),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  AutoSizeText(
                    "If you make a mistake when submitting, you'll have to wait 10s to answer again.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.vt323(
                        textStyle: TextStyle(
                            fontSize: shortestSide < 600 ? 25 : 30,
                            fontWeight: FontWeight.bold)),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ClipRRect(
                      borderRadius: shortestSide < 600
                          ? BorderRadius.circular(10.0)
                          : BorderRadius.circular(20.0),
                      child: Container(
                        height: shortestSide < 600 ? null : null,
                        width: shortestSide < 600 ? width * 0.8 : width * 0.6,
                        child: Center(
                          child: Image.asset(
                            'assets/timer.gif',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    onPressed: () {
                      widget.callback();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: shortestSide < 600 ? 20 : 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: Container()),
                  CircularButton(
                    color: HexColor.fromHex("#fe0100"),
                    splashColor: HexColor.fromHex("#fe0100").withAlpha(10),
                    children: [
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: shortestSide < 600 ? 30 : 45,
                      )
                    ],
                    onTap: () {
                      Navigator.push(
                          context,
                          RevealRoute(
                              page: Onboarding4(callback: widget.callback),
                              maxRadius: height * 2,
                              centerAlignment: Alignment.center,
                              centerOffset: Offset(0, 0),
                              minRadius: 0));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
