import 'package:flutter/material.dart';

import '../../app/routes/app_pages.dart';

class Services{
  String iconPath;
  String service;
  String route;

  Services({
  required this.iconPath,
  required this.service,
  required this. route,
});

}

var  availableServices = [
  Services(
    iconPath: 'assets/images/transfer.png', 
    service: 'Transfer', 
    route: Routes.TRANSFER_SCREEN,
    ),
  Services(
    iconPath: 'assets/images/pay_bills.png', 
    service: 'Pay Bills', 
    route: Routes.PAYBILLS_SCREEN,
  ),
];









 







