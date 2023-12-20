import '../../app/routes/app_pages.dart';

class Features {
  String iconPath;
  String service;
  String route;

  Features({
    required this.iconPath,
    required this.service,
    required this.route,
  });
}

var availableFeatures = [
  Features(
    iconPath: 'assets/images/bill_splitter.png',
    service: 'Bill\nSplitter',
    route: Routes.BILL_SPLITTER_SCREEN,
  ),
  Features(
    iconPath: 'assets/images/manage_budget.png',
    service: 'Manage\nBudget',
    route: Routes.MANAGE_BUDGET_SCREEN,
  ),
  Features(
    iconPath: 'assets/images/borrowmoney.png',
    service: 'Borrow',
    route: Routes.BORROW_SCREEN,
  ),
  Features(
    iconPath: 'assets/images/invest.png',
    service: 'Invest',
    route: Routes.INVEST_SCREEN ,
  ),
];

