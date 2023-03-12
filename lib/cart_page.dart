import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/bloc/go_asbeza_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('go asbeza'),
          centerTitle: true,
          actions: [
            Container(
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                icon: const Icon(Icons.account_circle_outlined),
              ),
            )
          ],
        ),
        body: BlocBuilder<AsbezaBloc, GoAsbezaState>(
          builder: (context, state) {
            if (state is GoAsbezaInitial) {
              return const Center(
                  child: Text(
                "NO HISTORY TO SHOW!\n TOTAL: 0\$",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ));
            }
            if (state is GoAsbezaloding) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GoAsbezaIsucsess) {
              if (state.Histo.isEmpty) {
                return const Center(
                    child: Text(
                  " history is empty please add to cart !\n TOTAL: 0\$",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ));
              } else {
                num TOTAL_PRICE = 0;
                void IncrementCounter() {
                  for (var element in state.Histo) {
                    TOTAL_PRICE += element.foodPrice;
                  }
                }

                IncrementCounter();
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        "TOTAL:${TOTAL_PRICE.toStringAsFixed(3)}\Birr",
                        style: const TextStyle(
                            fontSize: 34,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 650,
                          child: ListView.builder(
                              itemCount: state.Histo.length,
                              itemBuilder: (BuildContext context, int index) {
                                final goasbezaval = state.Histo[index];
                                return Container(
                                  height: 171,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: const Color.fromRGBO(
                                          92, 95, 99, 100)),
                                  margin: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 98,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.contain,
                                                    image: NetworkImage(
                                                        goasbezaval.image)),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: const Color.fromRGBO(
                                                    217, 217, 217, 100)),
                                            margin: const EdgeInsets.fromLTRB(
                                                15, 13, 0, 0),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        30, 45, 0, 0),
                                                child: Text(
                                                    "price:${goasbezaval.foodPrice}\Birr",
                                                    style: const TextStyle(
                                                        fontSize: 25,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Container(
                                                width: 110,
                                                height: 30,
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        40, 10, 0, 0),
                                                child:
                                                    Text(goasbezaval.foodTitle),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ],
                );
              }
            }
            return Container();
          },
        ));
  }
}
