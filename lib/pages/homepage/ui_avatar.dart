import 'package:flutter/material.dart';
import 'package:learn/common/app_image.dart';

class UIAvatar extends StatefulWidget {
  const UIAvatar({super.key});

  @override
  State<UIAvatar> createState() => _UIAvatarState();
}

class _UIAvatarState extends State<UIAvatar> {
  bool isSearching = false;
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void startSearch() {
      setState(() {
        isSearching = true;
        // Khi bắt đầu tìm kiếm, focus vào ô input
        FocusScope.of(context).requestFocus(searchFocusNode);
      });
    }

    void endSearch() {
      setState(() {
        isSearching = false;
        // Khi kết thúc tìm kiếm, loại bỏ focus và đóng bàn phím
        FocusScope.of(context).unfocus();
      });
    }

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            AppImages.avatar,
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
          onTap: isSearching ? endSearch : startSearch,
          child: Icon(
            isSearching ? Icons.close : Icons.search,
            size: 35,
          ),
        ),
        if (isSearching)
          Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            color: Theme.of(context).colorScheme.primary,
            child: TextField(
              focusNode: searchFocusNode,
              onSubmitted: (_) => endSearch(),
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
              ),
            ),
          ),
      ],
    );
  }
}
