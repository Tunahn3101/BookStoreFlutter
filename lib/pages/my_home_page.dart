import 'package:flutter/material.dart';
import 'package:learn/components/book_card.dart';
import 'package:learn/components/book_card_newest.dart';
import 'package:learn/pages/home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'lib/images/avatar.jpg',
                    height: 50,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Hi, Tunahn!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.search,
                  size: 35,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 16, bottom: 16),
                  child: Text(
                    'Popular Books',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        BookCard(
                            imageUrl: 'lib/images/book1.jpg',
                            title: 'Fashionopolis',
                            description: 'Dana Thomas'),
                        BookCard(
                            imageUrl: 'lib/images/book2.jpg',
                            title: 'Chanel',
                            description: 'Jones Leblan'),
                        BookCard(
                            imageUrl: 'lib/images/book3.jpg',
                            title: 'Nghiệt Duyên',
                            description: 'Thomayanati'),
                        BookCard(
                            imageUrl: 'lib/images/book4.jpg',
                            title: 'No Family',
                            description: 'Hector Malot'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 10),
                  child: Text(
                    'Newest',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      top: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BookCardVertical(
                          imageUrl: 'lib/images/book6.jpg',
                          title: 'Yves Saint Laurent',
                          description: 'Suzy Menkes',
                          rating: '4.5',
                        ),
                        BookCardVertical(
                          imageUrl: 'lib/images/book7.jpg',
                          title: 'Ilov3you',
                          description: 'Mohayder',
                          rating: '4.0',
                        ),
                        BookCardVertical(
                          imageUrl: 'lib/images/book1.jpg',
                          title: 'Xuan Toc Do',
                          description: 'DonQuiXoTe',
                          rating: '4.6',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                selectedItemColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                    ),
                    label: 'Trang chủ',
                    backgroundColor: Color.fromARGB(255, 216, 133, 55),
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bookmark_outline,
                        color: Colors.black,
                      ),
                      label: 'Bookmark',
                      backgroundColor: Colors.pink),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    label: 'Cart',
                    backgroundColor: Colors.green,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.black,
                    ),
                    label: 'Settings',
                    backgroundColor: Colors.purple,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
