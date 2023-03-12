import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/go_asbeza_bloc.dart';

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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
      body: BlocBuilder<AsbezaBloc, GoAsbezaState>(builder: (context, state) {
        if (state is GoAsbezaInitial) {
          return Center(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/3047.jpg"), fit: BoxFit.cover)),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 700, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AsbezaBloc>(context)
                          .add(const GoasbezaEvent());
                    },
                    child: const Text("Start"),
                  ),
                ),
              ],
            ),
          ));
        }
        if (state is GoAsbezaloding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GoAsbezaIsucsess) {
          return ListView.builder(
              itemCount: state.Goasbeza.length,
              itemBuilder: (BuildContext context, int index) {
                final goasbezaval = state.Goasbeza[index];
                return Container(
                  height: 171,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromRGBO(92, 95, 99, 100)),
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 138,
                            width: 123,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(goasbezaval.image)),
                                borderRadius: BorderRadius.circular(8),
                                color:
                                    const Color.fromRGBO(217, 217, 217, 100)),
                            margin: const EdgeInsets.fromLTRB(15, 13, 0, 0),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 132,
                                height: 73,
                                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: Text(
                                  goasbezaval.foodTitle,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Text(
                                  "price:${goasbezaval.foodPrice}\$",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              // Container(
                              //   margin:
                              //       const EdgeInsets.fromLTRB(30, 30, 0, 0),
                              //   child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         primary: Color.fromARGB(255, 22, 196,
                              //             30), // Background color
                              //       ),
                              //       onPressed: () {},
                              //       child: const Text("+")),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(5, 30, 5, 0),
                              //   color: Color.fromARGB(0, 50, 146, 190),
                              //   child: const Text("5"),
                              // ),
                              // Container(
                              //   margin: EdgeInsets.fromLTRB(60, 30, 0, 0),
                              //   child: ElevatedButton(
                              //       style: ElevatedButton.styleFrom(
                              //         primary: Color.fromARGB(255, 197, 52,
                              //             8), // Background color
                              //       ),
                              //       onPressed: () {},
                              //       child: const Text("-")),
                              // ),
                            ],
                          ),
                          Container(
                            width: 149,
                            height: 31,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(34)),
                            margin: EdgeInsets.fromLTRB(60, 14, 0, 5),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(
                                      255, 72, 211, 8), // Background color
                                ),
                                onPressed: () {
                                  BlocProvider.of<AsbezaBloc>(context)
                                      .add(Histoevent(goasbeza: goasbezaval));
                                },
                                child: const Text("buy")),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        }

        return Container();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const cart_page()),
          );
        },
        backgroundColor: Color.fromARGB(255, 146, 143, 143),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
