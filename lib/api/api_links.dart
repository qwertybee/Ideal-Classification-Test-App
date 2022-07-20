class ApiConstants {
  static List<String> categoriesMajorWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Major Occupation Group&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesBroadWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Broad Occupation&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesMinorWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Minor Occupation Group&Workforce Status=true&Record Count>=5"];
  static List<String> categoriesDetailWage = ["https://datausa.io/api/data?measure=Average%20Wage,Average%20Wage%20Appx MOE,Record Count&drilldowns=Detailed Occupation&Workforce Status=true&Record Count>=5"];

  static List<List<String>> cateMajorInfo = [
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


  static List<List<String>> cateDetailInfo = [
    cateDetailCashier,
    cateDetailRetail,
    cateDetailDriver,
    cateDetailElem,
    cateDetailNurse,
    cateDetailSuperSales,
    cateDetailCusService,
    cateDetailJanitor,
    cateDetailManager,
    cateDetailCooks,
    cateDetailLaborers,
    cateDetailWaiter,
    cateDetailSecretaries,
    cateDetailConstruc,
    cateDetailAccount,
    cateDetailMaid,
    cateDetailChildcare,
    cateDetailPostSec,
    cateDetailClerk,
    cateDetailNursing,
    cateDetailOtherMan,
    cateDetailProdWork,
    cateDetailRecep,
    cateDetailSaleRep,
    cateDetailSupOffice,
    cateDetailCarpen,
    cateDetailStock,
    cateDetailBook,
    cateDetailLegis,
    cateDetailFood,
    cateDetailNonRetail,
    cateDetailFinan,
    cateDetailGrounds,
    cateDetailLawyers,
    cateDetailGuards,
    cateDetailAides,
    cateDetailAgri,
    cateDetailFoodMan,
    cateDetailEduAd,
    cateDetailGenMan,
    cateDetailSecret,
    cateDetailBroker,
    cateDetailManAnal,
    cateDetailTest,
    cateDetailSecTeach,
    cateDetailOpWork,
    cateDetailHairDress,
    cateDetailLicPrac,
    cateDetailAutoSer,
    cateDetailElec,
    cateDetailHrWork,
    cateDetailTeaAss,
    cateDetailConsWork,
    cateDetailSoftDev,
    cateDetailAssem,
    cateDetailPolice,
    cateDetailConstrMan,
    cateDetailInstruc,
    cateDetailKindTea,
    cateDetailMedMan,
    cateDetailPainter,
    cateDetailShip,
    cateDetailBraz,
    cateDetailTruck,
    cateDetailAdSup,
    cateDetailRealEst,
    cateDetailStockers,
    cateDetailFarmer,
    cateDetailPacker,
    cateDetailSaleMan,
    cateDetailDesigner,
    cateDetailServWork,
    cateDetailCompMan,
    cateDetailRepairWork,
    cateDetailSurgeon,
    cateDetailSocial,
    cateDetailInsurance,
    cateDetailCounsel,
    cateDetailMedAss,
    cateDetailEngineer,
    cateDetailPersonAid,
    cateDetailBillClerk,
    cateDetailNurseAss,
    cateDetailTeachAss,
    cateDetailGroundskeep,
    cateDetailSoftDeve,
    cateDetailBartender,
    cateDetailChef,
    cateDetailClergy,
    cateDetailSaleSer,
    cateDetailDish,
    cateDetailEquip,
    cateDetailPlasticWork,
    cateDetailBus,
    cateDetailTech,
    cateDetailCompSup,
    cateDetailLegal,
    cateDetailOtherComp,
    cateDetailHost,
    cateDetailHrMan,
  ];

  // Detailed group's subcategories
  static List<String> cateDetailCashier = [
    "https://datausa.io/api/data?PUMS Occupation=412010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=412010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailRetail = [
    "https://datausa.io/api/data?PUMS Occupation=412031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=412031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailDriver = [
    "https://datausa.io/api/data?PUMS Occupation=533030&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=533030&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailElem = [
    "https://datausa.io/api/data?PUMS Occupation=252020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=252020&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailNurse = [
    "https://datausa.io/api/data?PUMS Occupation=291141&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=291141&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSuperSales = [
    "https://datausa.io/api/data?PUMS Occupation=411011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=411011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCusService = [
    "https://datausa.io/api/data?PUMS Occupation=434051&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=434051&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailJanitor = [
    "https://datausa.io/api/data?PUMS Occupation=37201X&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=37201X&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailManager = [
    "https://datausa.io/api/data?PUMS Occupation=119XXX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119XXX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCooks = [
    "https://datausa.io/api/data?PUMS Occupation=352010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=352010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailLaborers = [
    "https://datausa.io/api/data?PUMS Occupation=537062&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=537062&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailWaiter = [
    "https://datausa.io/api/data?PUMS Occupation=353031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=353031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSecretaries = [
    "https://datausa.io/api/data?PUMS Occupation=436010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=436010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailConstruc = [
    "https://datausa.io/api/data?PUMS Occupation=472061&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=472061&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailAccount = [
    "https://datausa.io/api/data?PUMS Occupation=132011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=132011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailMaid = [
    "https://datausa.io/api/data?PUMS Occupation=372012&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=372012&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailChildcare = [
    "https://datausa.io/api/data?PUMS Occupation=399011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=399011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPostSec = [
    "https://datausa.io/api/data?PUMS Occupation=251000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=251000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailClerk = [
    "https://datausa.io/api/data?PUMS Occupation=439061&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=439061&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailNursing = [
    "https://datausa.io/api/data?PUMS Occupation=311010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailOtherMan = [
    "https://datausa.io/api/data?PUMS Occupation=1191XX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailProdWork = [
    "https://datausa.io/api/data?PUMS Occupation=5191XX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=5191XX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailRecep = [
    "https://datausa.io/api/data?PUMS Occupation=434171&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=434171&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSaleRep = [
    "https://datausa.io/api/data?PUMS Occupation=414010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=414010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSupOffice = [
    "https://datausa.io/api/data?PUMS Occupation=431011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=431011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCarpen = [
    "https://datausa.io/api/data?PUMS Occupation=472031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=472031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailStock = [
    "https://datausa.io/api/data?PUMS Occupation=435081&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailBook = [
    "https://datausa.io/api/data?PUMS Occupation=433031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=433031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailLegis = [
    "https://datausa.io/api/data?PUMS Occupation=1110XX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=1110XX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailFood = [
    "https://datausa.io/api/data?PUMS Occupation=352021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=352021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailNonRetail = [
    "https://datausa.io/api/data?PUMS Occupation=411012&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=411012&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailFinan = [
    "https://datausa.io/api/data?PUMS Occupation=113031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=113031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailGrounds = [
    "https://datausa.io/api/data?PUMS Occupation=373010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=373010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailLawyers = [
    "https://datausa.io/api/data?PUMS Occupation=2310XX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=2310XX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailGuards = [
    "https://datausa.io/api/data?PUMS Occupation=339030&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=339030&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailAides = [
    "https://datausa.io/api/data?PUMS Occupation=399021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailAgri = [
    "https://datausa.io/api/data?PUMS Occupation=4520XX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=4520XX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailFoodMan = [
    "https://datausa.io/api/data?PUMS Occupation=119051&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119051&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailEduAd = [
    "https://datausa.io/api/data?PUMS Occupation=119030&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailGenMan = [
    "https://datausa.io/api/data?PUMS Occupation=111021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=111021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSecret = [
    "https://datausa.io/api/data?PUMS Occupation=436014&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailBroker = [
    "https://datausa.io/api/data?PUMS Occupation=419020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=419020&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailManAnal = [
    "https://datausa.io/api/data?PUMS Occupation=131111&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=131111&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailTest = [
    "https://datausa.io/api/data?PUMS Occupation=519061&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=519061&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSecTeach = [
    "https://datausa.io/api/data?PUMS Occupation=252030&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=252030&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailOpWork = [
    "https://datausa.io/api/data?PUMS Occupation=511011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=511011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailHairDress = [
    "https://datausa.io/api/data?PUMS Occupation=395012&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=395012&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailLicPrac = [
    "https://datausa.io/api/data?PUMS Occupation=292061&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=292061&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailAutoSer = [
    "https://datausa.io/api/data?PUMS Occupation=493023&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=493023&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailElec = [
    "https://datausa.io/api/data?PUMS Occupation=472111&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=472111&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailHrWork = [
    "https://datausa.io/api/data?PUMS Occupation=131070&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=131070&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailTeaAss = [
    "https://datausa.io/api/data?PUMS Occupation=259041&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailConsWork = [
    "https://datausa.io/api/data?PUMS Occupation=471011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=471011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSoftDev = [
    "https://datausa.io/api/data?PUMS Occupation=15113X&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailAssem = [
    "https://datausa.io/api/data?PUMS Occupation=512090&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=512090&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPolice = [
    "https://datausa.io/api/data?PUMS Occupation=333050&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailConstrMan = [
    "https://datausa.io/api/data?PUMS Occupation=119021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailInstruc = [
    "https://datausa.io/api/data?PUMS Occupation=253000&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=253000&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailKindTea = [
    "https://datausa.io/api/data?PUMS Occupation=252010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=252010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailMedMan = [
    "https://datausa.io/api/data?PUMS Occupation=119111&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119111&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPainter = [
    "https://datausa.io/api/data?PUMS Occupation=472140&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailShip = [
    "https://datausa.io/api/data?PUMS Occupation=435071&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=435071&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailBraz = [
    "https://datausa.io/api/data?PUMS Occupation=514120&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailTruck = [
    "https://datausa.io/api/data?PUMS Occupation=537051&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=537051&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailAdSup = [
    "https://datausa.io/api/data?PUMS Occupation=439XXX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=439XXX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailRealEst = [
    "https://datausa.io/api/data?PUMS Occupation=119141&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119141&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailStockers = [
    "https://datausa.io/api/data?PUMS Occupation=537065&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailFarmer = [
    "https://datausa.io/api/data?PUMS Occupation=119013&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=119013&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPacker = [
    "https://datausa.io/api/data?PUMS Occupation=537064&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=537064&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSaleMan = [
    "https://datausa.io/api/data?PUMS Occupation=112020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=112020&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailDesigner = [
    "https://datausa.io/api/data?PUMS Occupation=271020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=271020&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailServWork = [
    "https://datausa.io/api/data?PUMS Occupation=351012&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=351012&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCompMan = [
    "https://datausa.io/api/data?PUMS Occupation=113021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=113021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailRepairWork = [
    "https://datausa.io/api/data?PUMS Occupation=499071&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=499071&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSurgeon = [
    "https://datausa.io/api/data?PUMS Occupation=291060&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailSocial = [
    "https://datausa.io/api/data?PUMS Occupation=211020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=211020&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailInsurance = [
    "https://datausa.io/api/data?PUMS Occupation=413021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=413021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCounsel = [
    "https://datausa.io/api/data?PUMS Occupation=211010&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=211010&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailMedAss = [
    "https://datausa.io/api/data?PUMS Occupation=319092&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=319092&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailEngineer = [
    "https://datausa.io/api/data?PUMS Occupation=1721YY&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=1721YY&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPersonAid = [
    "https://datausa.io/api/data?PUMS Occupation=311122&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailBillClerk = [
    "https://datausa.io/api/data?PUMS Occupation=433021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=433021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailNurseAss = [
    "https://datausa.io/api/data?PUMS Occupation=311131&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailTeachAss = [
    "https://datausa.io/api/data?PUMS Occupation=259040&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailGroundskeep = [
    "https://datausa.io/api/data?PUMS Occupation=373011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailSoftDeve = [
    "https://datausa.io/api/data?PUMS Occupation=151252&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailBartender = [
    "https://datausa.io/api/data?PUMS Occupation=353011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=353011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailChef = [
    "https://datausa.io/api/data?PUMS Occupation=351011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=351011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailClergy = [
    "https://datausa.io/api/data?PUMS Occupation=212011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=212011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailSaleSer = [
    "https://datausa.io/api/data?PUMS Occupation=413099&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailDish = [
    "https://datausa.io/api/data?PUMS Occupation=359021&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=359021&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailEquip = [
    "https://datausa.io/api/data?PUMS Occupation=537061&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=537061&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailPlasticWork = [
    "https://datausa.io/api/data?PUMS Occupation=514XXX&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=514XXX&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailBus = [
    "https://datausa.io/api/data?PUMS Occupation=533020&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailTech = [
    "https://datausa.io/api/data?PUMS Occupation=292050&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=292050&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailCompSup = [
    "https://datausa.io/api/data?PUMS Occupation=151150&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailLegal = [
    "https://datausa.io/api/data?PUMS Occupation=232011&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=232011&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailOtherComp = [
    "https://datausa.io/api/data?PUMS Occupation=151199&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "null"
  ];
  static List<String> cateDetailHost = [
    "https://datausa.io/api/data?PUMS Occupation=359031&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=359031&drilldowns=Skill%20Element&parents=true"
  ];
  static List<String> cateDetailHrMan = [
    "https://datausa.io/api/data?PUMS Occupation=113121&drilldowns=CIP2&measures=Total Population,Total Population MOE Appx,yocpop RCA,Record%20Count&Record%20Count>=5&Workforce Status=true&Degree=21",
    "https://datausa.io/api/data?measure=LV%20Value,RCA&PUMS%20Occupation=113121&drilldowns=Skill%20Element&parents=true"
  ];
}