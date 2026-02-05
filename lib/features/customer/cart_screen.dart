import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartlink/core/theme/app_theme.dart';
import 'package:smartlink/core/widgets/smart_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(), // Or go back to home if tab
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.verified_user, color: AppTheme.primaryColor),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Protected Payment',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Your funds are held in escrow until delivery',
                              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.storefront, size: 18),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'TechHaven',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.check_circle, color: AppTheme.primaryColor, size: 12),
                          SizedBox(width: 4),
                          Text(
                            'Trusted',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _CartItem(
                  name: 'Wireless Noise Cancelling Headphones',
                  price: '\$249.00',
                  quantity: 1,
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBvpkzqphctFPfgm_E2Bmu_390sb7X59GrheI23n3E6LTVbN-GmdVRZFvucZDBkYEjoM3tYEMlbE6zPS_kqMLkvJlA-KdcnGdstnw4vYu8xFczSZghhg4JLcXWI3Wt1lg0BSHiE6mkp3zxRv8wEHK6iWNLdZ3soStIeWC1pWAKFRo8TzzZDqtaSNNkFOVHMwT8JoQmhMWsZNt6DElBdSpT4ubUNX2Wq4GbVaikItOhcSfZOt5rch3fFjsvRqshURcWHaQ88tNvD42R3',
                ),
                const SizedBox(height: 12),
                _CartItem(
                  name: 'USB-C Fast Charger',
                  price: '\$29.99',
                  quantity: 2,
                  imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDLRCwOgjocoo8k9Mh75bD1g5UxC3M4zexpAZCyFfdIckdqDl2q_LQT1wcMoIKR10sgNTz0v2wlOr989oEBIQY6Qeg54xGZz8OQxZWWi_5IIWp5Wzx3pze7xeUjt1oLYS2dtNKkG9_G1lPpAcspBJxM3N4OFzPk3ANhoiPqChTIfGK8OG6kJbaIjkGhyp2o4b_r-CV7OwYRDawBt9QH1ffXQQQVoAG6YJSnesdjgoxAKnmiqL18GsbF7RXDPxasDTauBsEheLOQukwo',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Subtotal', style: TextStyle(color: Colors.grey)),
                    Text('\$308.98', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                SmartButton(
                  label: 'Proceed to Payment',
                  icon: Icons.arrow_forward,
                  onPressed: () => context.push('/customer/checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final String imageUrl;

  const _CartItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  Container(width: 80, height: 80, color: Colors.grey[200]),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove, size: 16),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
                IconButton(
                  icon: const Icon(Icons.add, size: 16),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
