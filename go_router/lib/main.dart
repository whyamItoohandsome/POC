// lib/main.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'GoRouter Deep Links Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}

// Router Configuration
final router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        // Product Routes
        GoRoute(
          path: 'product/:id',
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            return ProductScreen(productId: productId);
          },
        ),

        // Category Routes
        GoRoute(
          path: 'category/:name',
          builder: (context, state) {
            final category = state.pathParameters['name']!;
            return CategoryScreen(category: category);
          },
        ),

        // User Profile Routes
        GoRoute(
          path: 'user/:id',
          builder: (context, state) {
            final userId = state.pathParameters['id']!;
            return ProfileScreen(userId: userId);
          },
        ),

        // Nested Routes Example (Product Reviews)
        GoRoute(
          path: 'product/:id/reviews',
          builder: (context, state) {
            final productId = state.pathParameters['id']!;
            return ProductReviewsScreen(productId: productId);
          },
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);

// Screen Widgets
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/product/123'),
              child: const Text('Go to Product 123'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/category/electronics'),
              child: const Text('Go to Electronics Category'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/user/john_doe'),
              child: const Text('Go to User Profile'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  final String productId;

  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $productId')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product Details for ID: $productId'),
            ElevatedButton(
              onPressed: () => context.go('/product/$productId/reviews'),
              child: const Text('View Reviews'),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category: $category')),
      body: Center(child: Text('Browsing $category category')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile: $userId')),
      body: Center(child: Text('User Profile: $userId')),
    );
  }
}

class SearchScreen extends StatelessWidget {
  final String query;
  final String filter;

  const SearchScreen({super.key, required this.query, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search Query: $query'),
            Text('Filter: $filter'),
          ],
        ),
      ),
    );
  }
}

class ProductReviewsScreen extends StatelessWidget {
  final String productId;

  const ProductReviewsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews for Product $productId')),
      body: Center(child: Text('Reviews for product $productId')),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Something went wrong!'),
            if (error != null) Text(error.toString()),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}
