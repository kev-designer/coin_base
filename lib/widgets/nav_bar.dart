import 'package:coin_base/view/home_screen.dart';
import 'package:coin_base/view/new_screen.dart';
import 'package:coin_base/view/search_screen.dart';
import 'package:coin_base/widgets/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'colors.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentTab = 0;
  Widget currentScreen = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorData.primary,
        title: Text("Coinbase App", style: GoogleFonts.nunito())
            .text
            .xl2
            .semiBold
            .make(),
      ),
      body: screens[currentTab],
      bottomNavigationBar: BottomAppBar(
        elevation: 6,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 70,
          child: HStack(
            alignment: MainAxisAlignment.spaceBetween,
            [
              //SEARCH
              MaterialButton(
                minWidth: 1,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = const SearchScreen();
                      currentTab = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/search.svg",
                      color:
                          currentTab == 1 ? ColorData.primary : ColorData.grey,
                    ),
                    6.heightBox,
                    Text(
                      "Search",
                      style: GoogleFonts.lato(
                        fontWeight:
                            currentTab == 1 ? FontWeight.w400 : FontWeight.w400,
                        fontSize: height(context) * .013,
                        color: currentTab == 1
                            ? ColorData.primary
                            : ColorData.grey,
                      ),
                    ),
                  ],
                ),
              ),
              //NEWS
              MaterialButton(
                minWidth: 1,
                onPressed: () {
                  setState(
                    () {
                      currentScreen = const NewsScreen();
                      currentTab = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/news.svg",
                      color:
                          currentTab == 2 ? ColorData.primary : ColorData.grey,
                    ),
                    6.heightBox,
                    Text(
                      "News",
                      style: GoogleFonts.lato(
                        fontSize: height(context) * .013,
                        fontWeight:
                            currentTab == 2 ? FontWeight.w400 : FontWeight.w400,
                        color: currentTab == 2
                            ? ColorData.primary
                            : ColorData.grey,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ).px(20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorData.primary,
        child: SvgPicture.asset("assets/svgs/C.svg"),
        onPressed: () {
          setState(
            () {
              currentScreen = const HomeScreen();
              currentTab = 0;
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

final List<Widget> screens = [
  const HomeScreen(),
  const SearchScreen(),
  const NewsScreen(),
];
