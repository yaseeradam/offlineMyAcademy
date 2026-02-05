import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartlink/features/auth/role_selection_screen.dart';
import 'package:smartlink/features/customer/cart_screen.dart';
import 'package:smartlink/features/customer/customer_shell.dart';
import 'package:smartlink/features/customer/explore_screen.dart';
import 'package:smartlink/features/customer/checkout_screen.dart';
import 'package:smartlink/features/customer/home_screen.dart';
import 'package:smartlink/features/customer/order_tracking_screen.dart';
import 'package:smartlink/features/customer/product_detail_screen.dart';
import 'package:smartlink/features/customer/profile_screen.dart';
import 'package:smartlink/features/auth/identity_verification_screen.dart';
import 'package:smartlink/features/merchant/add_item_screen.dart';
import 'package:smartlink/features/merchant/edit_storefront_screen.dart';
import 'package:smartlink/features/merchant/merchant_dashboard_screen.dart';
import 'package:smartlink/features/pilot/active_mission_screen.dart';
import 'package:smartlink/features/pilot/missions_feed_screen.dart';
import 'package:smartlink/features/wallet/wallet_screen.dart';
import 'package:smartlink/features/wallet/withdrawal_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/customer/product',
      builder: (context, state) => const ProductDetailScreen(),
    ),
    GoRoute(
      path: '/customer/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
    GoRoute(
      path: '/customer/tracking',
      builder: (context, state) => const OrderTrackingScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CustomerShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/customer/home',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/customer/explore',
              builder: (context, state) => const ExploreScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/customer/cart',
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/customer/profile',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/pilot/missions',
      builder: (context, state) => const MissionsFeedScreen(),
    ),
    GoRoute(
      path: '/pilot/active-mission',
      builder: (context, state) => const ActiveMissionScreen(),
    ),
    GoRoute(
      path: '/merchant/dashboard',
      builder: (context, state) => const MerchantDashboardScreen(),
    ),
    GoRoute(
      path: '/merchant/edit-storefront',
      builder: (context, state) => const EditStorefrontScreen(),
    ),
    GoRoute(
      path: '/merchant/add-item',
      builder: (context, state) => const AddItemScreen(),
    ),
    GoRoute(
      path: '/wallet',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/wallet/withdraw',
      builder: (context, state) => const WithdrawalScreen(),
    ),
    GoRoute(
      path: '/auth/verify',
      builder: (context, state) => const IdentityVerificationScreen(),
    ),
  ],
);
