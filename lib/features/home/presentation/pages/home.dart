part of '../../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<BottomNavigationCubit>(context).setIndex(4);
          },
          child: Image.asset(
            "assets/icon_cart.png",
            width: 20,
          ),
          backgroundColor: secondaryColor,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          child: BlocBuilder<BottomNavigationCubit, int>(
            builder: (context, state) {
              return BottomNavigationBar(
                onTap: (index) {
                  BlocProvider.of<BottomNavigationCubit>(context)
                      .setIndex(index);
                },
                backgroundColor: backgroundColor4,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.asset(
                        "assets/icon_home.png",
                        width: 21,
                        color:
                            state == 0 ? primaryColor : const Color(0xff808191),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 15,
                      ),
                      child: Image.asset(
                        "assets/icon_chat.png",
                        width: 21,
                        color:
                            state == 1 ? primaryColor : const Color(0xff808191),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 15,
                      ),
                      child: Image.asset(
                        "assets/icon_wishlist.png",
                        width: 21,
                        color:
                            state == 2 ? primaryColor : const Color(0xff808191),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: '',
                    icon: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Image.asset(
                        "assets/icon_profile.png",
                        width: 18,
                        color:
                            state == 3 ? primaryColor : const Color(0xff808191),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }

    Widget body() {
      return BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, state) {
          if (state == 0) {
            return const BerandaPage();
          } else if (state == 1) {
            return const ChatPage();
          } else if (state == 2) {
            return const WishListPage();
          } else if (state == 3) {
            return const ProfilePage();
          } else {
            return const CartPage();
          }
        },
      );
    }

    return Scaffold(
      extendBody: true,
      backgroundColor: backgroundColor1,
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
