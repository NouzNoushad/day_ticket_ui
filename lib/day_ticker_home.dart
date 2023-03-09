import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'day_ticket_details.dart';

class DayTickerUI extends StatelessWidget {
  const DayTickerUI({super.key});

  static List<Color> colors = [
    Colors.indigo,
    Colors.pink,
    Colors.green,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.teal.shade200,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.white,
                ),
                Text(
                  'My Ticket'.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: ClipPath(
                      clipper: CustomClipperDesign(),
                      child: Container(
                        height: size.height * 0.7,
                        width: size.width * 0.8,
                        color: Colors.white,
                        child: Column(children: [
                          Stack(
                            children: [
                              ClipPath(
                                clipper: CustomDesign(),
                                child: Container(
                                  height: size.height * 0.5,
                                  color: colors[index],
                                  padding: const EdgeInsets.all(20),
                                  child: const DayTicketDetails(),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 35,
                                child: Container(
                                  height: 12,
                                  width: 250,
                                  child: customDottedDesign(),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                'assets/bar_code.png',
                              ),
                              Positioned(
                                bottom: 6,
                                left: size.width * 0.10,
                                child: const Text(
                                  'Ticket will expire 21 June 2023 at 12:45',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget customDottedDesign() => Row(
      children: List.generate(
          300 ~/ 10,
          (index) => Expanded(
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor:
                      index % 2 == 0 ? Colors.transparent : Colors.white,
                ),
              )));
}

class CustomDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.moveTo(12, 12);
    path.lineTo(12, h - 60);
    path.lineTo(45, h - 5);
    path.lineTo(w, h - 5);
    path.lineTo(w - 40, h - 5);
    path.lineTo(w - 12, h - 60);
    path.lineTo(w - 12, 12);
    path.lineTo(w / 1.5, 12);
    path.quadraticBezierTo(w / 2, 60, w / 3.2, 12);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomClipperDesign extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double h = size.height;
    double w = size.width;

    path.lineTo(0, h - 220);
    path.lineTo(32, h - 160);
    path.lineTo(0, h - 110);
    path.lineTo(0, h);
    path.lineTo(w / 3, h);
    path.quadraticBezierTo(w / 2, h - 50, w / 1.5, h);
    path.lineTo(w, h);
    path.lineTo(w, h - 110);
    path.lineTo(w - 28, h - 160);
    path.lineTo(w, h - 220);
    path.lineTo(w, 0);
    path.lineTo(w / 1.5, 0);
    path.quadraticBezierTo(w / 2, 50, w / 3, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
