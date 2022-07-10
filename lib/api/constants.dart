class ApiConstants {
  static List<String> categoriesMajorWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Major Occupation Group&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesBroadWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Broad Occupation&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesMinorWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Minor Occupation Group&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesDetailWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Detailed Occupation&Workforce Status=true&Record Count>=5"];

  static List<List<String>> cateMajorInfo = [
    // categoriesMajorWage,
    categoriesMajorManagement,
    categoriesMajorSales,
    categoriesMajorService,
    categoriesMajorProduction,
    categoriesMajorNatural,
    categoriesMajorMilitary,
  ];
  // Major group's subcategories
  static List<String> categoriesMajorManagement = [
    // [0] education [1] skills
    "https://datausa.io/api/data?PUMS Occupation=110000-290000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=110000-290000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMajorSales = [
    "https://datausa.io/api/data?PUMS Occupation=410000-430000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=410000-430000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMajorService = [
    "https://datausa.io/api/data?PUMS Occupation=310000-390000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=310000-390000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMajorProduction = [
    "https://datausa.io/api/data?PUMS Occupation=510000-530000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=510000-530000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMajorNatural = [
    "https://datausa.io/api/data?PUMS Occupation=450000-490000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=450000-490000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMajorMilitary = [
    "https://datausa.io/api/data?PUMS Occupation=550000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];

  static List<List<String>> cateBroadInfo = [
    categoriesBroadManagement,
    categoriesBroadEdu,
    categoriesBroadBusiness,
    categoriesBroadTrans,
    categoriesBroadMaterial,
    categoriesBroadComp,
    categoriesBroadArts,
    categoriesBroadArch,
    categoriesBroadComm,
    categoriesBroadLegal,
    categoriesBroadLife,
  ];
  // Broad group's subcategories
  static List<String> categoriesBroadManagement = [
    // [0] education [1] skills
    "https://datausa.io/api/data?PUMS Occupation=110000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=110000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadEdu = [
    "https://datausa.io/api/data?PUMS Occupation=250000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=250000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadBusiness = [
    "https://datausa.io/api/data?PUMS Occupation=130000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=130000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadTrans = [
    "https://datausa.io/api/data?PUMS Occupation=531000-536000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=531000-536000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadMaterial = [
    "https://datausa.io/api/data?PUMS Occupation=537000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=537000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadComp = [
    "https://datausa.io/api/data?PUMS Occupation=150000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=150000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadArts = [
    "https://datausa.io/api/data?PUMS Occupation=270000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=270000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadArch = [
    "https://datausa.io/api/data?PUMS Occupation=170000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=170000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadComm = [
    "https://datausa.io/api/data?PUMS Occupation=210000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=210000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadLegal = [
    "https://datausa.io/api/data?PUMS Occupation=230000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=230000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesBroadLife = [
    "https://datausa.io/api/data?PUMS Occupation=190000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=190000&drilldowns=Skill%20Element&parents=true"
  ];

  static List<List<String>> cateMinorInfo = [
    categoriesMinorManagement,
    categoriesMinorOffice,
    categoriesMinorEdu,
    categoriesMinorSales,
    categoriesMinorTrans,
    categoriesMinorFood,
    categoriesMinorProd,
    categoriesMinorHealthPrac,
    categoriesMinorComp,
    categoriesMinorConstruc,
    categoriesMinorBuild,
    categoriesMinorPerson,
    categoriesMinorInstall,
    categoriesMinorHealthSupp,
    categoriesMinorProtect,
    categoriesMinorFarm,
  ];

  // Minor's group subcategories
  static List<String> categoriesMinorManagement = [
    "https://datausa.io/api/data?PUMS Occupation=110000-130000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=110000-130000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorOffice = [
    "https://datausa.io/api/data?PUMS Occupation=430000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=430000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorEdu = [
    "https://datausa.io/api/data?PUMS Occupation=210000-270000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=210000-270000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorSales = [
    "https://datausa.io/api/data?PUMS Occupation=410000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=410000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorTrans = [
    "https://datausa.io/api/data?PUMS Occupation=530000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=530000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorFood = [
    "https://datausa.io/api/data?PUMS Occupation=350000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=350000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorProd = [
    "https://datausa.io/api/data?PUMS Occupation=510000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=510000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorHealthPrac = [
    "https://datausa.io/api/data?PUMS Occupation=290000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=290000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorComp = [
    "https://datausa.io/api/data?PUMS Occupation=150000-190000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=150000-190000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorConstruc = [
    "https://datausa.io/api/data?PUMS Occupation=470000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=470000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorBuild = [
    "https://datausa.io/api/data?PUMS Occupation=370000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=370000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorPerson = [
    "https://datausa.io/api/data?PUMS Occupation=390000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=390000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorInstall = [
    "https://datausa.io/api/data?PUMS Occupation=490000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=490000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorHealthSupp = [
    "https://datausa.io/api/data?PUMS Occupation=310000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=310000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorProtect = [
    "https://datausa.io/api/data?PUMS Occupation=330000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=330000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> categoriesMinorFarm = [
    "https://datausa.io/api/data?PUMS Occupation=450000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=450000&drilldowns=Skill%20Element&parents=true"
  ];


  static List<List<String>> cateDetailInfo = [];

  // Detailed group's subcategories
  static List<String> cateDetailCashier = [];
  static List<String> cateDetailRetail = [];
  static List<String> cateDetailDriver = [];
  static List<String> cateDetailElem = [];
  static List<String> cateDetailNurse = [];
  static List<String> cateDetailSuperSales = [];
  static List<String> cateDetailCusService = [];
  static List<String> cateDetailJanitor = [];
  static List<String> cateDetailManager = [];
  static List<String> cateDetailCooks = [];
  static List<String> cateDetailLaborers = [];
  static List<String> cateDetailWaiter = [];
  static List<String> cateDetailSecretaries = [];
  static List<String> cateDetailConstruc = [];
  static List<String> cateDetailAccount = [];
  static List<String> cateDetailMaid = [];
  static List<String> cateDetailChildcare = [];
  static List<String> cateDetailPostSec = [];
  static List<String> cateDetailClerk = [];
  static List<String> cateDetailNursing = [];
  static List<String> cateDetailOtherMan = [];
  static List<String> cateDetailProdWork = [];
  static List<String> cateDetailRecep = [];
  static List<String> cateDetailSaleRep = [];
  static List<String> cateDetailSupOffice = [];
  static List<String> cateDetailCarpen = [];
  static List<String> cateDetailStock = [];
  static List<String> cateDetailBook = [];
  static List<String> cateDetailLegis = [];
  static List<String> cateDetailFood = [];
  static List<String> cateDetailNonRetail = [];
  static List<String> cateDetailFinan = [];
  static List<String> cateDetailGrounds = [];
  static List<String> cateDetailLawyers = [];
  static List<String> cateDetailGuards = [];
  static List<String> cateDetailAides = [];
  static List<String> cateDetailAgri = [];
  static List<String> cateDetailFoodMan = [];
  static List<String> cateDetailEduAd = [];
  static List<String> cateDetailGenMan = [];
  static List<String> cateDetailSecret = [];
  static List<String> cateDetailBroker = [];
  static List<String> cateDetailManAnal = [];
  static List<String> cateDetailTest = [];
  static List<String> cateDetailSecTeach = [];
  static List<String> cateDetailOpWork = [];
  static List<String> cateDetailHairDress = [];
  static List<String> cateDetailLicPrac = [];
  static List<String> cateDetailAutoSer = [];
  static List<String> cateDetailElec = [];
  static List<String> cateDetailHrWork = [];
  static List<String> cateDetailTeaAss = [];
  static List<String> cateDetailConsWork = [];
  static List<String> cateDetailSoftDev = [];
  static List<String> cateDetailAssem = [];
  static List<String> cateDetailPolice = [];
  static List<String> cateDetailConstrMan = [];
  static List<String> cateDetailInstruc = [];
  static List<String> cateDetailKindTea = [];
  static List<String> cateDetailMedMan = [];
  static List<String> cateDetailPainter = [];
  static List<String> cateDetailShip = [];
  static List<String> cateDetailBraz = [];
  static List<String> cateDetailTruck = [];
  static List<String> cateDetailAdSup = [];
  static List<String> cateDetailRealEst = [];
  static List<String> cateDetailStockers = [];
  static List<String> cateDetailFarmer = [];
  static List<String> cateDetailPacker = [];
  static List<String> cateDetailSaleMan = [];
  static List<String> cateDetailDesigner = [];
  static List<String> cateDetailServWork = [];
  static List<String> cateDetailCompMan = [];
  static List<String> cateDetailRepairWork = [];
  static List<String> cateDetailSurgeon = [];
  static List<String> cateDetailSocial = [];
  static List<String> cateDetailInsurance = [];
  static List<String> cateDetailCounsel = [];
  static List<String> cateDetailMedAss = [];
  static List<String> cateDetailEngineer = [];
  static List<String> cateDetailPersonAid = [];
  static List<String> cateDetailBillClerk = [];
  static List<String> cateDetailNurseAss = [];
  static List<String> cateDetailTeachAss = [];
  static List<String> cateDetailGroundskeep = [];
  static List<String> cateDetailSoftDeve = [];
  static List<String> cateDetailBartender = [];
  static List<String> cateDetailChef = [];
  static List<String> cateDetailClergy = [];
  static List<String> cateDetailSaleSer = [];
  static List<String> cateDetailDish = [];
  static List<String> cateDetailEquip = [];
  static List<String> cateDetailPlasticWork = [];
  static List<String> cateDetailBus = [];
  static List<String> cateDetailTech = [];
  static List<String> cateDetailCompSup = [];
  static List<String> cateDetailLegal = [];
  static List<String> cateDetailOtherComp = [];
  static List<String> cateDetailHost = [];
  static List<String> cateDetailHrMan = [];
}