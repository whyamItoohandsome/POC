// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:auto_route_deep_linking/screen/home_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i3;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute({List<_i2.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i1.ProductDetailsScreen]
class ProductDetailsRoute extends _i2.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required String productId,
    _i3.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
         ProductDetailsRoute.name,
         args: ProductDetailsRouteArgs(productId: productId, key: key),
         rawPathParams: {'id': productId},
         initialChildren: children,
       );

  static const String name = 'ProductDetailsRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ProductDetailsRouteArgs>(
        orElse:
            () =>
                ProductDetailsRouteArgs(productId: pathParams.getString('id')),
      );
      return _i1.ProductDetailsScreen(productId: args.productId, key: args.key);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({required this.productId, this.key});

  final String productId;

  final _i3.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{productId: $productId, key: $key}';
  }
}

/// generated route for
/// [_i1.ProductListScreen]
class ProductListRoute extends _i2.PageRouteInfo<void> {
  const ProductListRoute({List<_i2.PageRouteInfo>? children})
    : super(ProductListRoute.name, initialChildren: children);

  static const String name = 'ProductListRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.ProductListScreen();
    },
  );
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i2.PageRouteInfo<void> {
  const ProfileRoute({List<_i2.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i2.PageInfo page = _i2.PageInfo(
    name,
    builder: (data) {
      return const _i1.ProfileScreen();
    },
  );
}
