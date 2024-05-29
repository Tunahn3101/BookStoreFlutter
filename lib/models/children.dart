// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChildrenItem {
  final String name;
  final String description;
  ChildrenItem({
    required this.name,
    required this.description,
  });
}

class ParentItem {
  final String title;
  final List<ChildrenItem> childrenList;
  ParentItem({
    required this.title,
    required this.childrenList,
  });
}
