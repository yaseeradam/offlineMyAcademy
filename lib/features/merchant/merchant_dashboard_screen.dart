import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartlink/core/theme/app_theme.dart';

class MerchantDashboardScreen extends StatelessWidget {
  const MerchantDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildTrustBanner(),
                  const SizedBox(height: 24),
                  _buildMetricsCarousel(),
                  const SizedBox(height: 24),
                  _buildSectionHeader('New Orders', 'View All'),
                  const SizedBox(height: 12),
                  const _NewOrdersList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/merchant/add-item'),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.inventory_2), label: 'Inventory'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => context.push('/merchant/edit-storefront'),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB7pvT7Ri5sh6Wz66H2X7NWtKigtZKuRi8B8c2-kA-LYYtJebeHMiwDF1s8atvzYILTAWZ51_hnpaCD4kdhtiv14LUi22qXG9qUjUcpLPm6BzRRXvL8VEWeQYxs3CLI418ephK9VCSPb7IwnL0hKi26E2iAvWMr8OsO8GPxOJ9BVTvinRM-S-YSvTBWJU24rNm00CdEdpeh25B7Gosue8kMAhITa5-hycusbAUER0VRzzZs8CaB4B_kz03uNoWcZHpmYh87goh7nXTF'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome back,', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  const Text('Burger Joint', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications_outlined, color: Colors.black),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrustBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.verified_user, size: 16, color: AppTheme.primaryColor),
                    const SizedBox(width: 4),
                    const Text(
                      'STATUS ACTIVE',
                      style: TextStyle(
                        color: AppTheme.primaryColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Trusted Merchant',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Your storefront is now visible to all premium users.',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.storefront, color: AppTheme.primaryColor, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsCarousel() {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _MetricCard(
            icon: Icons.payments,
            label: 'Total Earnings',
            value: '\$1,240.50',
            color: AppTheme.primaryColor,
          ),
          const SizedBox(width: 16),
          _MetricCard(
            icon: Icons.receipt_long,
            label: 'Active Orders',
            value: '12',
            color: Colors.orange,
          ),
          const SizedBox(width: 16),
          _MetricCard(
            icon: Icons.check_circle,
            label: 'Issue Reports',
            value: '0',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(
          action,
          style: const TextStyle(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _MetricCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NewOrdersList extends StatelessWidget {
  const _NewOrdersList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _OrderItem(
          id: '#2931',
          title: 'Spicy Chicken Combo x2',
          time: 'Just now',
          status: 'Awaiting Cooking',
          statusColor: AppTheme.primaryColor,
          total: '\$24.50',
        ),
        SizedBox(height: 12),
        _OrderItem(
          id: '#2930',
          title: 'Laptop Screen Repair',
          time: '12 mins ago',
          status: 'Diagnosis Needed',
          statusColor: Colors.amber,
          total: '\$120.00',
        ),
        SizedBox(height: 12),
        _OrderItem(
          id: '#2928',
          title: 'Family Feast Box',
          time: '35 mins ago',
          status: 'Ready',
          statusColor: Colors.blue,
          total: '\$85.00',
        ),
      ],
    );
  }
}

class _OrderItem extends StatelessWidget {
  final String id;
  final String title;
  final String time;
  final String status;
  final Color statusColor;
  final String total;

  const _OrderItem({
    required this.id,
    required this.title,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        id,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
                      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total: $total', style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              // Avatars placeholder
              Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: Colors.grey.shade200),
                  const SizedBox(width: -8),
                  CircleAvatar(radius: 12, backgroundColor: Colors.grey.shade300, child: const Text('+1', style: TextStyle(fontSize: 8))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
