class Category {
  final String name;
  final String numOfGroups;
  final String image;

  Category(this.name, this.numOfGroups, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'].toString(), item['groups'].toString(), item['image'].toString()))
    .toList();

var categoriesData = [
  {"name": "Major Group", 'groups': 6, 'image': "images/marketing.png"},
  {"name": "Broad Occupation", 'groups': 11, 'image': "images/ux_design.png"},
  {
    "name": "Minor Group",
    'groups': 16,
    'image': "images/photography.png"
  },
  {"name": "Detailed Occupation", 'groups': 70, 'image': "images/business.png"},
];