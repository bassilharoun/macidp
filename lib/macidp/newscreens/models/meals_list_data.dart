class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String>? meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/images/200.png',
      titleTxt: 'ONE YEAR',
      kacl: 200,
      meals: <String>['53% Discount,','EXP : 2024-10-19'],
      startColor: '#0072E7',
      endColor: '#0A296D',
    ),
    MealsListData(
      imagePath: 'assets/images/250.png',
      titleTxt: 'THREE YEARS',
      kacl: 300,
      meals: <String>['57% Discount', 'EXP : 2026-10-19'],
      startColor: '#FE95B6',
      endColor: '#8201E9',
    ),
    MealsListData(
      imagePath: 'assets/images/300.png',
      titleTxt: 'TOW YEARS',
      kacl: 250,
      meals: <String>['55% Discount,', 'EXP : 2025-10-19'],
      startColor: '#FFFF8A',
      endColor: '#D89501',
    ),

  ];
}
