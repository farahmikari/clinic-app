class ItemModel {
  final int id;
  final String title;
  final String icon;

  ItemModel({required this.id, required this.title, required this.icon});

  factory ItemModel.fromJson(Map<String, dynamic> jsonData) {
    return ItemModel(
      id: jsonData["id"],
      title: jsonData["title"],
      icon: jsonData["icon"],
    );
  }
}
