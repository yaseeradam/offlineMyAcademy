import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Role')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => context.go('/customer/home'),
            child: const Text('Customer App'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/pilot/missions'),
            child: const Text('Pilot App'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/merchant/dashboard'),
            child: const Text('Merchant App'),
          ),
        ],
      ),
    );
  }
}
