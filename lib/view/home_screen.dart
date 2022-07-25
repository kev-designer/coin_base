import 'package:coin_base/model/home_model.dart';
import 'package:coin_base/services/services.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat();

  TickerName tickerName = TickerName();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: VStack(
          [
            FutureBuilder(
              future: tickerName.getTickersApi(),
              builder: (context, AsyncSnapshot<Data> snapshot) {
                print(snapshot);
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: VStack(
                            [
                              snapshot.data!.id.toString().text.make(),
                              20.heightBox,
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: ColorData.primary,
                              ),
                              //TOTAL CASES
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     "Total Cases".text.make(),
                              //     snapshot.data!.cases.toString().text.make(),
                              //   ],
                              //   // alignment: MainAxisAlignment.spaceBetween,
                              // ),
                              // 20.heightBox,
                            ],
                          ),
                        ),
                      ),
                      60.heightBox,
                    ],
                  );
                } else {
                  return Expanded(
                    flex: 1,
                    child: SpinKitCircle(
                      color: ColorData.primary,
                      controller: animationController,
                    ),
                  );
                }
              },
            ),
          ],
        ).p20(),
      ),
    );
  }
}
