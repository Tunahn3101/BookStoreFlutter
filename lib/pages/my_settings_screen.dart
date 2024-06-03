import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn/common/app_image.dart';
import 'package:learn/components/custom_list_item.dart';
import 'package:learn/models/children.dart';
import 'package:learn/theme_provider/theme_prvider.dart';
import 'package:provider/provider.dart';

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
    // final User user = User(name: 'tunahn', age: 30, gender: Gender.male);

    // final List<ParentItem> data = [
    //   ParentItem(
    //     title: 'Category 1',
    //     childrenList: [
    //       ChildrenItem(name: 'Item 1', description: 'Description of Item 1'),
    //       ChildrenItem(name: 'Item 2', description: 'Description of Item 2'),
    //       ChildrenItem(name: 'Item 3', description: 'Description of Item 3'),
    //     ],
    //   ),
    //   ParentItem(
    //     title: 'Category 2',
    //     childrenList: [
    //       ChildrenItem(name: 'Item A', description: 'Description of Item A'),
    //       ChildrenItem(name: 'Item B', description: 'Description of Item B'),
    //     ],
    //   ),
    // ];

    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider
        .updateSystemBrightness(MediaQuery.of(context).platformBrightness);
    final currentBrightness = Theme.of(context).brightness;
    Color borderColor =
        (currentBrightness == Brightness.dark) ? Colors.white : Colors.black;
    void themeModeDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  RadioListTile<ThemeMode>(
                    title: const Text('Sáng'),
                    value: ThemeMode.light,
                    groupValue: themeProvider.themeMode,
                    onChanged: (ThemeMode? value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Tối'),
                    value: ThemeMode.dark,
                    groupValue: themeProvider.themeMode,
                    onChanged: (ThemeMode? value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                  RadioListTile<ThemeMode>(
                    title: const Text('Tự động'),
                    value: ThemeMode.system,
                    groupValue: themeProvider.themeMode,
                    onChanged: (ThemeMode? value) {
                      if (value != null) {
                        themeProvider.setThemeMode(value);
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  themeModeDialog();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Theme Mode'),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                      )
                    ],
                  ),
                ),
              )

              // ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: data.length,
              //   itemBuilder: (context, index) {
              //     final parentItem = data[index];
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           parentItem.title,
              //           style: const TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 18),
              //         ),
              //         SingleChildScrollView(
              //           scrollDirection: Axis.horizontal,
              //           child: Row(
              //             children: [
              //               for (final childItem in parentItem.childrenList)
              //                 Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Column(
              //                     children: [
              //                       Text(childItem.name),
              //                       Text(childItem.description),
              //                     ],
              //                   ),
              //                 ),
              //             ],
              //           ),
              //         ),
              //         const Divider(
              //           height: 1,
              //           color: Colors.grey,
              //         )
              //       ],
              //     );
              //   },
              // ),
              // const SizedBox(height: 4),
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
        ),
      ),
    );
  }
}
