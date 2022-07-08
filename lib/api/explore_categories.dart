class Category {
  final String name;
  final String numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'].toString(), item['courses'].toString(), item['image'].toString()))
    .toList();

var categoriesData = [
  {"name": "Marketing", 'courses': 17, 'image': "/images/marketing.png"},
  {"name": "UX Design", 'courses': 25, 'image': "/images/ux_design.png"},
  {
    "name": "Photography",
    'courses': 13,
    'image': "/images/photography.png"
  },
  {"name": "Business", 'courses': 17, 'image': "/images/business.png"},
];