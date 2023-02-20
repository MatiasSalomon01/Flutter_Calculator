import 'package:fl_calculator/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 50), child: const Botones()));
  }
}

class Botones extends StatefulWidget {
  const Botones({super.key});

  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  // bool state = true;
  // String num = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.red,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 179, 179, 179),
                    fixedSize: const Size(80, 60),
                  ),
                  child: const Icon(
                    Icons.light_mode_outlined,
                    size: 30,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 179, 179, 179),
                      fixedSize: const Size(80, 60)),
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Container(
          //color: Colors.green,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 6,
          child: Container(
            margin: const EdgeInsets.only(right: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    '100 x 100',
                    style: TextStyle(fontSize: 25, color: Colors.grey),
                  ),
                  Container(
                      margin: const EdgeInsets.only(right: 5),
                      child:
                          const Text('10.000', style: TextStyle(fontSize: 40)))
                ]),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            child: Container(
              color: const Color.fromARGB(255, 224, 224, 224),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, left: 20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 179, 179, 179),
                                fixedSize: const Size.square(85)),
                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // final theme = Provider.of<ThemeChanger>(context);
    // return Column(
    //   children: [
    //     Container(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           FloatingActionButton(
    //               onPressed: () {
    //                 theme.setTheme(ThemeChanger.lightTheme());
    //                 state = !state;
    //               },
    //               child: const Icon(
    //                 Icons.light_mode_outlined,
    //               )),
    //           FloatingActionButton(
    //               onPressed: () {
    //                 theme.setTheme(ThemeChanger.darkTheme());
    //                 state = !state;
    //               },
    //               child: const Icon(
    //                 Icons.dark_mode_outlined,
    //                 //color: Colors.blue,
    //               ))
    //         ],
    //       ),
    //     ),
    //     Container(
    //       margin: const EdgeInsets.only(top: 80, bottom: 20),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           Column(
    //             children: [
    //               const Text("", style: TextStyle(fontSize: 20)),
    //               Padding(
    //                 padding: const EdgeInsets.only(right: 25),
    //                 child: Text("$num", style: const TextStyle(fontSize: 40)),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Expanded(
    //               child: Container(
    //             //padding: EdgeInsets.zero,
    //             //height: MediaQuery.of(context).size.height,
    //             //alignment: AlignmentDirectional.bottomCenter,
    //             decoration: ThemeChanger.conteinerTheme(state),
    //             child: GridView.count(
    //               padding: const EdgeInsets.only(
    //                   top: 20, right: 10, left: 10, bottom: 20),
    //               mainAxisSpacing: 11,
    //               crossAxisSpacing: 2,
    //               shrinkWrap: true,
    //               physics: const NeverScrollableScrollPhysics(),
    //               crossAxisCount: 4,
    //               children: [
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num = "";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('AC')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "+/-";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('+/-')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "%";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('%')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "/";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('/')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "7";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('7')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "8";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('8')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "9";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('9')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "X";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('X')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "4";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('4')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "5";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('5')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "6";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('6')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "-";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('-')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "1";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('1')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "2";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('2')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "3";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('3')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "+";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('+')),
    //                 TextButton(
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Icon(Icons.replay_sharp),
    //                     onPressed: () {}),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "0";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('0')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += ".";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('.')),
    //                 TextButton(
    //                     onPressed: () {
    //                       setState(() {
    //                         num += "=";
    //                       });
    //                     },
    //                     style: ThemeChanger.textButton(state),
    //                     child: const Text('='))
    //               ],
    //             ),
    //           ))
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
