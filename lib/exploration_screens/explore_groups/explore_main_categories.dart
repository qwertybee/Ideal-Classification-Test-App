import 'package:project_2/api/constants.dart';

class Category {
  final String name;
  final String tag;
  var nav;
  Category(this.name, this.tag, this.nav);
}

// THE FOUR MAIN CATEGORIES
List<Category> categories = categoriesData
    .map((item) => Category(item['name'].toString(), item['tag'].toString(), item['nav']))
    .toList();

var categoriesData = [
  {"name": "Major Group", 'tag': 6, 'nav': "images/marketing.png"},
  {"name": "Broad Occupation", 'tag': 11, 'nav': "images/ux_design.png"},
  {
    "name": "Minor Group",
    'tag': 16,
    'nav': "images/photography.png"
  },
  {"name": "Detailed Occupation", 'tag': 70, 'nav': "images/business.png"},
];


// EACH DETAIL OF MAJOR GROUP CATEGORIES
List<Category> categoriesMajor = categoriesMajorData
    .map((item) => Category(item['name'].toString(), item['tag'].toString(), item['nav'].toString()))
    .toList();

var categoriesMajorData = [
  {"name": "Management, business, science, & arts occupation", 'tag': "Major Occupation Group", 'nav': ApiConstants.cateMajorInfo},
  {"name": "Sales & Office occupations", 'tag': "Major Occupation Group", 'nav': ApiConstants.cateMajorInfo},
  {
    "name": "Service Occupations",
    'tag': "Major Occupation Group",
    'nav': ApiConstants.cateMajorInfo
  },
  {"name": "Production, Transportation, & Material Moving Occupations", 'tag': "Major Occupation Group", 'nav': ApiConstants.cateMajorInfo},
  {"name": "Natural resources, construction, & maintenance occupations", 'tag': "Major Occupation Group", 'nav': ApiConstants.cateMajorInfo},
  {"name": "Military specific occupations", 'tag': "Major Occupation Group", 'nav': ApiConstants.cateMajorInfo},
];


// EACH DETAIL OF BROAD GROUP CATEGORIES
List<Category> categoriesBroad = categoriesBroadData
    .map((item) => Category(item['name'].toString(), item['tag'].toString(), item['nav'].toString()))
    .toList();

var categoriesBroadData = [
  {"name": "Management Occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Education, Training, & Library Occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Business & Financial Operations Occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Transportation Occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Material Moving Occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {
    "name": "Computer & Mathematical Occupations",
    'tag': "Broad Occupation Group",
    'nav': ApiConstants.cateBroadInfo
  },
  {"name": "Arts, design, entertainment, sports, & media occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Architecture & engineering occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Community & Social Service occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Legal occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
  {"name": "Life, physical, & social science occupations", 'tag': "Broad Occupation Group", 'nav': ApiConstants.cateBroadInfo},
];


// EACH DETAIL OF MINOR GROUP CATEGORIES
List<Category> categoriesMinor = categoriesMinorData
    .map((item) => Category(item['name'].toString(), item['tag'].toString(), item['nav'].toString()))
    .toList();

var categoriesMinorData = [
  {"name": "Management, business, & financial occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Office & Administrative Support occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {
    "name": "Education, legal, community service, arts, & media occupations",
    'tag': "Minor Occupation Group",
    'nav': ApiConstants.cateMinorInfo
  },
  {"name": "Sales & related occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Transportation & material moving occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Food preparation & serving related occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Production occupations", 'tag': "Minor Occupation Group", 'nav': "images/business.png"},
  {"name": "Healthcare practitioners & technical occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Computer, engineering, & science occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Construction & Extraction occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Building & Grounds Cleaning & Maintenance occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Personal Care & Service occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Installation, maintenance, & report occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Healthcare support occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Protective service occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
  {"name": "Farming, Fishing, & Forestry occupations", 'tag': "Minor Occupation Group", 'nav': ApiConstants.cateMinorInfo},
];

// EACH DETAIL OF DETAILED GROUP CATEGORIES
List<Category> categoriesDetail = categoriesDetailData
    .map((item) => Category(item['name'].toString(), item['tag'].toString(), item['nav'].toString()))
    .toList();

var categoriesDetailData = [
  {"name": "Cashiers", 'tag': "Detailed Occupation Group", 'nav': "images/marketing.png"},
  {"name": "Retail salespersons", 'tag': "Detailed Occupation Group", 'nav': "images/ux_design.png"},
  {"name": "Driver/sales works & truck drivers", 'tag': "Detailed Occupation Group", 'nav': "images/photography.png"},
  {"name": "Elementary & middle school teachers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Registered nurses", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of retail sales workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Customer service representatives", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Janitors & building cleaners", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Cooks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Laborers & freight, stock & material movers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Waiters & waitresses", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Secretaries & administrative assistants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Construction laborers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Accountants & auditors", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Maids & housekeeping cleaners", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Childcare workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Postsecondary teachers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Office clerks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Nursing, psychiatric, & home health aides", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Other managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous production workers, including semiconductor processors", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Receptionists & information clerks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Sales representatives, wholesale & manufacturing", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of office & administrative support workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Carpenters", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Stock clerks & order fillers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Bookkeeping, accounting, & auditing clerks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Chief executives & legislators", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Food preparation workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of nonretail sales workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Financial managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Grounds maintenance workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Lawyers & judges, magistrates, & other judicial workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Security guards & gaming surveillance officers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Personal care aides (legacy)", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous agricultural workers, including animal breeders", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Food service managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Education administrators", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "General & operations managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Secretaries and administrative assistants, except legal, medical, and executive", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Real estate brokers & sales agents", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Management analysts", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Inspectors, testers, sorters, samplers & weighers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Secondary school teachers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of production & operating workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Hairdressers, hairstylists & cosmetologists", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Licensed practical & licensed vocational nurses", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Automotive service technicians & mechanics", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Electricians", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Human resources workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Teacher assistants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of construction trades & extraction workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Software developers, applications & systems software", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous assemblers & fabricators", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Police officers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Construction managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Other teachers & instructors", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Preschool & kindergarten teachers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Medical & health services managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Painters & paperhangers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Shipping, receiving, & traffic clerks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Welding, soldering & brazing workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Industrial truck & tractor operators", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous office & administrative support workers, including desktop publishers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Property, real estate, & community association managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Stockers and order fillers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Famers, ranchers, & other agricultural managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Packers & packagers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Marketing & sales managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Designers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Firstline supervisors of food prepartion & serving workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Computer & information systems managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Maintenance & repair workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Physicians & surgeons", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Social workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Insurance sales agents", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Counselors", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Medical assisstants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous enegineers, including nuclear engineers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Personal care aides", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Billing & posting clerks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Nursing assistants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Teaching assistants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Landscaping and groudskeeping workers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Software developers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Bartenders", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Chefs & head cooks", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Clergy", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Sales representatives, services", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Dishwashers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Cleaners of vehicles & equipment", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Miscellaneous metal workers & plastic workers, including multiple machine tool setters", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Bus drivers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Health practitioner support technologists & technicians", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Computer support specialists (legacy)", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Paralegals & legal assistants", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Other computer occupations", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Hosts & hostesses, restaurant, lounge, & coffee shop", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
  {"name": "Human resource managers", 'tag': "Detailed Occupation Group", 'nav': "images/business.png"},
];