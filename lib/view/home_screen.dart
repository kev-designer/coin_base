import 'package:coin_base/model/home_model.dart';
import 'package:coin_base/services/services.dart';
import 'package:coin_base/widgets/colors.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  TickerName tickerName = TickerName();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          Expanded(
            child: FutureBuilder<HomeModel>(
              future: tickerName.getTickersApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.data?.length,
                    itemBuilder: (context, index) {
                      Data? data = snapshot.data?.data?[index];
                      return VStack(
                        [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: ColorData.lightgrey),
                            ),
                            child: VStack(
                              crossAlignment: CrossAxisAlignment.start,
                              [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: ColorData.primary
                                                .withOpacity(.2),
                                          ),
                                          child: Center(
                                            child: Text(
                                              data?.rank?.toString() ?? "",
                                              style: GoogleFonts.nunito(
                                                color: ColorData.primary,
                                              ),
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).text.xl.semiBold.make(),
                                          ),
                                        ),
                                        12.widthBox,
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //NAME
                                            Text(
                                              data?.name?.toString() ?? "",
                                              style: GoogleFonts.nunito(),
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).text.xl.semiBold.make(),
                                            8.heightBox,

                                            //SYMBOL
                                            Text(
                                              data?.symbol?.toString() ?? "",
                                              style: GoogleFonts.nunito(
                                                color: ColorData.grey,
                                              ),
                                              softWrap: true,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).text.lg.medium.make(),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        //NAME
                                        Text(
                                          data?.priceUsd?.toString() ?? "",
                                          style: GoogleFonts.nunito(),
                                          softWrap: true,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).text.xl.semiBold.make(),
                                        8.heightBox,

                                        //SYMBOL
                                        Text(
                                          data?.percentChange1h?.toString() ??
                                              "",
                                          style: GoogleFonts.nunito(
                                            color: data?.percentChange1h
                                                        ?.toString() ==
                                                    "-"
                                                ? ColorData.red
                                                : ColorData.green,
                                          ),
                                          softWrap: true,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).text.lg.medium.make(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          16.heightBox,
                        ],
                      );
                    },
                  ).p(20);
                } else {
                  return SpinKitFoldingCube(
                    color: ColorData.primary,
                    size: height(context) * .03,
                    controller: animationController,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
