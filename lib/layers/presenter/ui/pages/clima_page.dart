import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import '../../controller/controller_weather.dart';
import '../components/clima_card.dart';
import '../components/today_card.dart';

class PageClima extends StatefulWidget {
  final StoreWeather store;
  const PageClima({Key? key, required this.store}) : super(key: key);

  @override
  State<PageClima> createState() => _PageClimaState();
}

class _PageClimaState extends State<PageClima> {
  late StoreWeather store;

  @override
  void initState() {
    super.initState();
    store = widget.store;
    textController.text = 'Maringá-PR';
    store.getClimaByCity(textController.text);
    OverlayEntry? overlay;

    //TODO fazer loading com um sol girando ou um achava caindo
    store.observer(
      onLoading: (isLoading) {
        if (isLoading == true) {
          overlay = OverlayEntry(builder: (context) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              child: Container(
                color: Colors.black45,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(color: Colors.white),
              ),
            );
          });
          Overlay.of(context)?.insert(overlay!);
        } else {
          overlay?.remove();
          overlay = null;
        }
      },
    );
  }

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.cover,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: 1.5,
                    sigmaY: 1.5,
                  ),
                  child: Image.asset(
                    'assets/image/ogarotodajanela.jpg',
                  ),
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.black45,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  // color: Colors.amber,
                  height: size.height * 0.22,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        textController.text,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 50),
                      ),
                      SizedBox(
                        width: size.width * 0.79,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: size.height * 0.07,
                              width: size.width * 0.6,
                              child: TextFormField(
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                controller: textController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.black45,
                                  labelText: 'Cidade',
                                  labelStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade600,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  store.getClimaByCity(textController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // color: Colors.red,
                  height: size.height * 0.73,
                  child: ScopedBuilder.transition(
                    transition: (context, widget) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 800),
                        child: widget,
                      );
                    },
                    store: store,
                    onState: (context, state) {
                      return Container(
                          height: size.height,
                          width: size.width,
                          child: LayoutBuilder(
                              builder: (buildcontext, constraints) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: size.height * 0.18,
                                  width: size.width * 0.95,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: Colors.black45,
                                  ),
                                  alignment: Alignment.center,
                                  child: LayoutBuilder(
                                      builder: (context, constraints) {
                                    return Container(
                                      width: constraints.maxWidth * 0.97,
                                      height: constraints.maxHeight * 0.90,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            store.mapWeather.forecast.length,
                                        itemBuilder: (context, index) {
                                          final forecast =
                                              store.mapWeather.forecast[index];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ClimaCard(
                                                height: size.height * 0.15,
                                                width: size.width * 0.25,
                                                day: forecast.day,
                                                temperature:
                                                    forecast.temperature,
                                                wind: forecast.wind,
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  }),
                                ),
                                TodayCard(
                                  width: constraints.maxWidth * 0.95,
                                  height: constraints.maxHeight * 0.55,
                                  iconClima: store.getIconClima(),
                                  temperature: store.mapWeather.temperature,
                                  wind: store.mapWeather.wind,
                                  description: store.mapWeather.description,
                                  cidade: textController.text,
                                ),
                              ],
                            );
                          })
                          //   ;

                          );
                    },
                    onError: (context, state) {
                      if (state != null) {
                        return Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height * 0.5,
                            width: size.width * 0.95,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Colors.black45,
                            ),
                            child: Text(
                              state.toString(),
                              //TODO  fazer a mensagem de error aparecer aqui

                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

//TERMINAR A PARTE PRA COMPLETAR A URL COM O QUE O USUARIO DIGITAR
