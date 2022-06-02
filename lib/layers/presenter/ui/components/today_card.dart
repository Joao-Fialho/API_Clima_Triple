import 'package:flutter/material.dart';

class TodayCard extends StatelessWidget {
  final String cidade;
  final String iconClima;
  final String temperature;
  final String wind;
  final String description;
  final double height;
  final double width;
  const TodayCard(
      {Key? key,
      this.temperature = 'temperatura',
      this.wind = 'Vento',
      this.description = 'Descrição',
      this.height = 150,
      this.width = 250,
      this.cidade = '',
      this.iconClima = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.black45,
        //blur nos components
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight * 0.78,
          width: constraints.maxWidth * 0.85,
          // color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                left: 0,
                child: Text(
                  cidade,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  alignment: Alignment.bottomRight,
                  width: 150,
                  height: 250,
                  // color: Colors.blue,
                  child: Image.asset(
                    iconClima,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      temperature,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Image.asset(
                            'assets/image/windicon.jpg',
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          wind,
                          style: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [

      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Text(
      //       temperature,
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: 28,
      //       ),
      //     ),
      //     Row(
      //       children: [
      //         Text(
      //           temperature,
      //           style: const TextStyle(
      //             color: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 10,
      //         ),
      //         Text(
      //           wind,
      //           style: const TextStyle(color: Colors.white),
      //         ),
      //       ],
      //     ),
      //     Text(
      //       description,
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //   ],
      // ),
      // const Icon(
      //   Icons.wb_sunny_rounded,
      //   size: 50,
      //   color: Colors.amber,
      // ),

      //   ],
      // ),
    );
  }
}
// Text(controller.mapClima.temperature),
// Text(controller.mapClima.wind),
// Text(controller.mapClima.description),
