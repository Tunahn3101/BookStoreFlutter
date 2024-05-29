import 'package:flutter/material.dart';
import 'package:learn/common/app_image.dart';
import 'package:learn/components/custom_list_item.dart';
import 'package:learn/models/children.dart';

// Sử dụng enums
enum Gender {
  male,
  female,
  other,
}

class User {
  final String name;
  final int age;
  final Gender gender;

  User({
    required this.name,
    required this.age,
    required this.gender,
  });
}

class MySettingsScreen extends StatelessWidget {
  const MySettingsScreen({
    Key? key,
  }) : super(key: key);

  // ...

  @override
  Widget build(BuildContext context) {
    final User user = User(name: 'tunahn', age: 30, gender: Gender.male);

    final List<ParentItem> data = [
      ParentItem(
        title: 'Category 1',
        childrenList: [
          ChildrenItem(name: 'Item 1', description: 'Description of Item 1'),
          ChildrenItem(name: 'Item 2', description: 'Description of Item 2'),
          ChildrenItem(name: 'Item 3', description: 'Description of Item 3'),
        ],
      ),
      ParentItem(
        title: 'Category 2',
        childrenList: [
          ChildrenItem(name: 'Item A', description: 'Description of Item A'),
          ChildrenItem(name: 'Item B', description: 'Description of Item B'),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              final parentItem = data[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    parentItem.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final childItem in parentItem.childrenList)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(childItem.name),
                                Text(childItem.description),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.grey,
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 4),
          // ListView(
          //   children: const [
          //     CustomListItem(
          //       title: 'Title 1',
          //       subtitle: 'Subtitle 1',
          //       imageURL: AppImages.book1,
          //     ),
          //     CustomListItem(
          //       title: 'Title 2',
          //       subtitle: 'Subtitle 2',
          //       imageURL: AppImages.book2,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
