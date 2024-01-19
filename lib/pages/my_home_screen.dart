import 'package:flutter/material.dart';
import 'package:learn/components/book_card.dart';
import 'package:learn/components/book_card_newest.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool _isSearching = false;
  late FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
      // Khi bắt đầu tìm kiếm, focus vào ô input
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
  }

  void _endSearch() {
    setState(() {
      _isSearching = false;
      // Khi kết thúc tìm kiếm, loại bỏ focus và đóng bàn phím
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
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
                GestureDetector(
                  onTap: _isSearching ? _endSearch : _startSearch,
                  child: Icon(
                    _isSearching ? Icons.close : Icons.search,
                    size: 35,
                  ),
                ),
                if (_isSearching)
                  Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      focusNode: _searchFocusNode,
                      onSubmitted: (_) => _endSearch(),
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 25, bottom: 16),
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
        ],
      ),
    );
  }
}
