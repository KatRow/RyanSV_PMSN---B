import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsnb1/card_planet.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final data = [
    CardPlanetData(
      title: "TecNM en Celaya",
      subtitle: "Red social nueva!",
      image: const AssetImage("assets/logo_itc.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.pink,
      subtitleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/wave-bg.json"),
    ),
    CardPlanetData(
      title: "Una nueva forma",
      subtitle: "de expresarte.",
      image: const AssetImage("assets/logo_itc.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
      background: LottieBuilder.asset("assets/animation/liquid-bg.json"),
    ),
    CardPlanetData(
      title: "Todo está en tus manos",
      subtitle: "¡Pruébala!",
      image: const AssetImage("assets/logo_itc.png"),
      backgroundColor: Colors.orange,
      titleColor: Colors.redAccent,
      subtitleColor: Colors.pink,
      background: LottieBuilder.asset("assets/animation/gradient-bg.json"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(data: data[index]);
        },
        onFinish: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
