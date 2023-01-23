// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nav animation',
      home: MyHomePage(title: 'Animation Ui advanced'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin, AfterLayoutMixin {
  Color baseColor = const Color(0xFFf2f2f2);
  final LabeledGlobalKey _one = LabeledGlobalKey("icon_1");
  final LabeledGlobalKey _two = LabeledGlobalKey("icon_2");
  final LabeledGlobalKey _three = LabeledGlobalKey("icon_3");
  final LabeledGlobalKey _four = LabeledGlobalKey("icon_4");
  final LabeledGlobalKey _five = LabeledGlobalKey("icon_5");
  bool isactive = false;
  int selected = 0;
  double dx = 10;
  late AnimationController controller;
  late Animation<double> animation;
  late Animation<double> curveanimation;
  late Animation<double> widthanimation;
  late Animation<double> positionanimation;
  late Animation<double> startscale;
  late Animation<double> opacityanimation;
  Offset _offset1 = const Offset(0.0, 0.0);

  fetchPostion1() {
    RenderBox box = _one.currentContext!.findRenderObject() as RenderBox;
    Offset offset = box.globalToLocal(Offset.zero);
    setState(() {
      _offset1 = offset;
    });
  }

  fetchPostion2() {
    RenderBox box = _two.currentContext!.findRenderObject() as RenderBox;
    Offset offset = box.globalToLocal(Offset.zero);
    setState(() {
      _offset1 = offset;
    });
  }

  fetchPostion3() {
    RenderBox box = _three.currentContext!.findRenderObject() as RenderBox;
    Offset offset = box.globalToLocal(Offset.zero);
    setState(() {
      _offset1 = offset;
    });
  }

  fetchPostion4() {
    RenderBox box = _four.currentContext!.findRenderObject() as RenderBox;
    Offset offset = box.globalToLocal(Offset.zero);
    setState(() {
      _offset1 = offset;
    });
  }

  fetchPostion5() {
    RenderBox box = _five.currentContext!.findRenderObject() as RenderBox;
    Offset offset = box.globalToLocal(Offset.zero);
    setState(() {
      _offset1 = offset;
    });
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    animation = Tween<double>(begin: 0.0, end: 20.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });
    curveanimation = Tween<double>(begin: 65.0, end: 25.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });
    widthanimation = Tween<double>(begin: 0.0, end: 0.1)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });
    positionanimation = Tween<double>(begin: 0.0, end: -120.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });

    opacityanimation = Tween<double>(begin: 0.8, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.elasticOut))
      ..addListener(() {
        setState(() {});
      });
    startscale = Tween<double>(begin: 1.0, end: 0.85).animate(CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubicEmphasized))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        elevation: 0,
        title: Text(widget.title),
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()..scale(startscale.value),
              child: Container(
                height: size.height * 0.14,
                width: startscale.value * size.width,
                color: baseColor,
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomPaint(
                  painter: BackgroundPainter(
                      offset: _offset1,
                      select: isactive,
                      x: animation.value,
                      opacity: opacityanimation.value,
                      deltax: curveanimation.value,
                      color: baseColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            baseColor = Colors.red.shade100;
                            isactive = true;
                            fetchPostion1();
                            if (controller.isCompleted) {
                              controller.reset();
                            }
                            controller.forward();

                            selected = 0;
                          });
                        },
                        child: Transform(
                          alignment: Alignment.bottomCenter,
                          transform: Matrix4.translationValues(0,
                              selected == 0 ? positionanimation.value : 0, 0),
                          child: Icon(
                            key: _one,
                            Icons.home_outlined,
                            color: selected == 0 ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            fetchPostion2();
                            baseColor = Colors.amber.shade100;
                            isactive = true;

                            if (controller.isCompleted) {
                              controller.reset();
                            }
                            controller.forward();

                            selected = 1;
                          });
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(0,
                              selected == 1 ? positionanimation.value : 0, 0),
                          child: Icon(
                            key: _two,
                            Icons.bookmark_added_outlined,
                            color: selected == 1 ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            fetchPostion3();
                            baseColor =
                                const Color.fromARGB(255, 192, 210, 255);
                            selected = 2;
                            if (controller.isCompleted) {
                              controller.reset();
                            }
                            controller.forward();
                          });
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(0,
                              selected == 2 ? positionanimation.value : 0, 0),
                          child: Icon(
                            key: _three,
                            Icons.loop_sharp,
                            color: selected == 2 ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            fetchPostion4();
                            isactive = true;
                            selected = 3;
                            if (controller.isCompleted) {
                              controller.reset();
                            }
                            controller.forward();

                            baseColor = Colors.blue.shade100;
                          });
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(0,
                              selected == 3 ? positionanimation.value : 0, 0),
                          child: Icon(
                            key: _four,
                            Icons.favorite_outline,
                            color: selected == 3 ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            fetchPostion5();
                            isactive = true;
                            baseColor = Colors.green.shade100;
                            selected = 4;
                            if (controller.isCompleted) {
                              controller.reset();
                            }
                            controller.forward();
                          });
                        },
                        child: Transform(
                          transform: Matrix4.translationValues(0,
                              selected == 4 ? positionanimation.value : 0, 0),
                          child: Icon(
                            key: _five,
                            Icons.person_outline,
                            color: selected == 4 ? Colors.white : Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bottom navigation Animated Package',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    setState(() {
      fetchPostion1();
    });
  }
}

class ClipBottomNav extends CustomClipper<Path> {
  Offset offset;
  final bool select;
  final double x;
  ClipBottomNav({
    required this.offset,
    required this.select,
    required this.x,
  });
  @override
  Path getClip(Size size) => getClipClip(size, select, offset, x);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class BackgroundPainter extends CustomPainter {
  Offset offset;
  final bool select;
  final double x;
  final double deltax;
  final Color color;
  final double opacity;
  BackgroundPainter({
    required this.offset,
    required this.select,
    required this.x,
    required this.deltax,
    required this.color,
    required this.opacity,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset c = Offset(-offset.dx + 15, -x - 5);
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white;
    Paint paint1 = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    canvas.drawRect(rect, paint2);
    canvas.drawPath(getClipClip(size, select, offset, deltax * opacity), paint);
    canvas.drawCircle(c, x * opacity, paint1);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => true;
}

Path getClipClip(Size size, bool select, Offset offset, double x) {
  final height = size.height * 0.57;

  Path path = Path();
  path.moveTo(0, size.height);
  path.lineTo(size.width, size.height);
  path.quadraticBezierTo(size.width, height, size.width - 30, height);
  path.lineTo(size.width - 25, height);
  if (select == true) {
    path.lineTo(-offset.dx + 50, height);

    path.quadraticBezierTo(-offset.dx + 15, x, -offset.dx - 25, height);
  }
  path.lineTo(20, height);
  path.quadraticBezierTo(0, height, 0, size.height);
  path.lineTo(0, height);
  path.close();
  return path;
}
