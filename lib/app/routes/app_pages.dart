import 'package:get/get.dart';

import '../../presentation/screen/bill_splitter__screen/bindings/bill_splitter_screen_binding.dart';
import '../../presentation/screen/bill_splitter__screen/views/bill_splitter_screen_view.dart';
import '../../presentation/screen/borrow_screen/bindings/borrow_screen_binding.dart';
import '../../presentation/screen/borrow_screen/views/borrow_screen_view.dart';
import '../../presentation/screen/home_detail_screen/bindings/home_detail_screen_binding.dart';
import '../../presentation/screen/home_detail_screen/views/home_detail_screen_view.dart';
import '../../presentation/screen/home_screen/bindings/home_screen_binding.dart';
import '../../presentation/screen/home_screen/view/home_screen.dart';
import '../../presentation/screen/invest_screen/bindings/invest_screen_binding.dart';
import '../../presentation/screen/invest_screen/views/invest_screen_view.dart';
import '../../presentation/screen/login_screen/bindings/login_screen_binding.dart';
import '../../presentation/screen/login_screen/views/login_screen_view.dart';
import '../../presentation/screen/manage_budget_screen/bindings/manage_budget_screen_binding.dart';
import '../../presentation/screen/manage_budget_screen/views/manage_budget_screen_view.dart';
import '../../presentation/screen/paybills_screen/bindings/paybills_screen_binding.dart';
import '../../presentation/screen/paybills_screen/views/paybills_screen_view.dart';
import '../../presentation/screen/transaction_details__screen/bindings/transaction_details_screen_binding.dart';
import '../../presentation/screen/transaction_details__screen/views/transaction_details_screen_view.dart';
import '../../presentation/screen/transfer_screen/bindings/transfer_screen_binding.dart';
import '../../presentation/screen/transfer_screen/views/transfer_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(
        title: 'Home',
      ),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME_DETAIL_SCREEN,
      page: () => const HomeDetailScreenView(),
      binding: HomeDetailScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER_SCREEN,
      page: () => const TransferScreenView(),
      binding: TransferScreenBinding(),
    ),
    GetPage(
      name: _Paths.PAYBILLS_SCREEN,
      page: () => const PaybillsScreenView(),
      binding: PaybillsScreenBinding(),
    ),
    GetPage(
      name: _Paths.BILL_SPLITTER_SCREEN,
      page: () => const BillSplitterScreenView(),
      binding: BillSplitterScreenBinding(),
    ),
    GetPage(
      name: _Paths.MANAGE_BUDGET_SCREEN,
      page: () => const ManageBudgetScreenView(),
      binding: ManageBudgetScreenBinding(),
    ),
    GetPage(
      name: _Paths.BORROW_SCREEN,
      page: () => const BorrowScreenView(),
      binding: BorrowScreenBinding(),
    ),
    GetPage(
      name: _Paths.INVEST_SCREEN,
      page: () => const InvestScreenView(),
      binding: InvestScreenBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION_DETAILS_SCREEN,
      page: () => TransactionDetailsScreenView(),
      binding: TransactionDetailsScreenBinding(),
    ),
  ];
}
