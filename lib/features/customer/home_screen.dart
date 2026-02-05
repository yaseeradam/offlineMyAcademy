import 'package:flutter/material.dart';
import 'package:smartlink/core/theme/app_theme.dart';
import 'package:smartlink/core/widgets/trust_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const _WalletCard(),
                  const SizedBox(height: 24),
                  _buildSectionHeader('Explore', 'View all'),
                  const SizedBox(height: 12),
                  const _CategoryList(),
                  const SizedBox(height: 24),
                  _buildSectionHeader('Nearby Storefronts', ''),
                  const SizedBox(height: 12),
                  const _NearbyStorefronts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TrustBadge(isVerified: true, text: 'Identity Verified'),
          Row(
            children: [
              const Icon(Icons.location_on, color: AppTheme.primaryColor),
              const SizedBox(width: 4),
              const Text(
                'San Francisco, CA',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Icon(Icons.expand_more, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        if (action.isNotEmpty)
          Text(
            action,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
      ],
    );
  }
}

class _WalletCard extends StatelessWidget {
  const _WalletCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [AppTheme.primaryColor, Color(0xFF4ADE80)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            right: -40,
            top: -40,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.memory, color: Colors.white70, size: 36),
                    const Icon(Icons.contactless, color: Colors.white70, size: 28),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '\$4,250.00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.lock, color: Colors.white70, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          'Protected Payment enabled',
                          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12),
                        ),
                      ],
                    ),
                    Text(
                      '•••• 8829',
                      style: TextStyle(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.grid_view, 'label': 'All'},
      {'icon': Icons.restaurant, 'label': 'Food'},
      {'icon': Icons.shopping_bag, 'label': 'Retail'},
      {'icon': Icons.spa, 'label': 'Services'},
      {'icon': Icons.local_grocery_store, 'label': 'Grocery'},
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: isSelected ? null : Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                if (cat['icon'] != null)
                  Icon(
                    cat['icon'] as IconData,
                    size: 18,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                const SizedBox(width: 8),
                Text(
                  cat['label'] as String,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _NearbyStorefronts extends StatelessWidget {
  const _NearbyStorefronts();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _StoreCard(
          name: 'GreenLeaf Market',
          type: 'Organic Groceries',
          distance: '0.8 mi',
          rating: '4.9',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCR9CJVVnbK50YA4_uQnic3-fWKX0C5x5n24PLyHz3CtHZShvLPDKmyGDTvWz36n-wDzEdBUqIq20PRTH3rAgDQj2ysJveL3ktDl13uFvoiBJq-wVF-LNnu00aEQM6HqHbn_H3ZCSYEQZTkNMznNd5CsgQMcJf6Mza6KnrAtuuwGow-Yb0Bd0jc8pK0hdRp-fCcZzd4bz3-X0xpI2AIRFJstCKIDX1VpsDMKeNOMKlXIB_W5jgBUMN7JFqkydGKY4J2lGTGPM-h4y3f',
        ),
        SizedBox(height: 16),
        _StoreCard(
          name: 'Apex Electronics',
          type: 'Tech & Gadgets',
          distance: '2.4 mi',
          rating: '4.7',
          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCYj7M7cDqzj5H4d1lI1ScWhLdmffMC3w-Lw5QSkZaycashnkYD4gRB4PVAiDExMPUI6iN-srHxrBgQQCxlhsyCvPPc7LHQ-FxHNhHWnJIloIAliOB3T-Cim1G3EEC3ukIOToIpKPWIqP9RqFp50EG3h9BSzNVv7RgJA8A_-RbaMdoZCuV6YO0fU1AWY7pyeRXZOhJXbIS8A25wGN5tPP3mhnIBkIXKZt53-r2KFsh79qqOUi96qiIIt_humqalzRVaSAvLTO6TUsYk',
        ),
      ],
    );
  }
}

class _StoreCard extends StatelessWidget {
  final String name;
  final String type;
  final String distance;
  final String rating;
  final String imageUrl;

  const _StoreCard({
    required this.name,
    required this.type,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Container(height: 150, color: Colors.grey[200]),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.check_circle, color: AppTheme.primaryColor, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Trusted',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 14, color: AppTheme.primaryColor),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '$type • $distance',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.rocket_launch, size: 16, color: AppTheme.primaryColor),
                    const SizedBox(width: 4),
                    const Text(
                      'Pilot Delivery',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Typically 15-20 min',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
