import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartlink/core/theme/app_theme.dart';
import 'package:smartlink/core/widgets/smart_button.dart';

class MissionsFeedScreen extends StatelessWidget {
  const MissionsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilters(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSectionTitle('Available Missions', '(3)'),
                  const SizedBox(height: 16),
                  _MissionCard(
                    price: '\$24.00',
                    tag: 'Pilot (Courier)',
                    pickup: '123 Market St',
                    pickupArea: 'Downtown',
                    dropoff: '4500 Pine Ave',
                    dropoffArea: 'Westside',
                    distance: '4.2 mi',
                    time: '15 mins',
                    isHighlighted: true,
                    onAccept: () => context.push('/pilot/active-mission'),
                  ),
                  const SizedBox(height: 16),
                  _MissionCard(
                    price: '\$18.50',
                    tag: 'Pilot (Courier)',
                    pickup: 'The Coffee Spot',
                    pickupArea: 'Midtown',
                    dropoff: 'Tech Hub Office',
                    dropoffArea: 'Innovation District',
                    distance: '2.1 mi',
                    time: '8 mins',
                    isHighlighted: false,
                    onAccept: () {},
                  ),
                  const SizedBox(height: 16),
                  _MissionCard(
                    price: '\$32.00',
                    tag: 'Large Order • Catering',
                    pickup: 'Burger Joint HQ',
                    pickupArea: 'Northside',
                    dropoff: 'Community Center',
                    dropoffArea: 'East Lake',
                    distance: '6.5 mi',
                    time: '22 mins',
                    isHighlighted: false,
                    onAccept: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.list), label: 'Feed'),
          NavigationDestination(icon: Icon(Icons.paid), label: 'Earnings'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDMqStvqGO0hEtrjwBAtmsgx7pn7tJnhFNQRL5E2eCj1eUTg-Ih9m6BaXORnULU5FfyWhyeM7O0BhBanUGie1aIDFZZCw-5BEqAsRi1f6oicPjsqJLfyABNHUSQhlUD2kpKeFFlWqD4XbSnSFJZPkM7LIxQmZufoRMicfQ83pe1huqbP6dgEPRTR6khux5ctC1_yIyh1Khq0Nv22i5vHngh2Pa0sFhrYDevBFTX9eBkU92O98LO7fS9Lbv0N5696Ka1ct3onSpXMdy0'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Alex Driver', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: const [
                      Icon(Icons.verified, size: 14, color: AppTheme.primaryColor),
                      SizedBox(width: 4),
                      Text(
                        'IDENTITY VERIFIED',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Text(
                  'Online',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _FilterChip(label: 'Highest Fee', icon: Icons.sort, isSelected: true),
          const SizedBox(width: 8),
          _FilterChip(label: 'Distance', icon: Icons.near_me, isSelected: false),
          const SizedBox(width: 8),
          _FilterChip(label: 'Urgency', icon: Icons.timer, isSelected: false),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          count,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;

  const _FilterChip({
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _MissionCard extends StatelessWidget {
  final String price;
  final String tag;
  final String pickup;
  final String pickupArea;
  final String dropoff;
  final String dropoffArea;
  final String distance;
  final String time;
  final bool isHighlighted;
  final VoidCallback onAccept;

  const _MissionCard({
    required this.price,
    required this.tag,
    required this.pickup,
    required this.pickupArea,
    required this.dropoff,
    required this.dropoffArea,
    required this.distance,
    required this.time,
    required this.isHighlighted,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Text(
                    tag.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              if (isHighlighted)
                SmartButton(
                  label: 'Accept',
                  icon: Icons.check,
                  isFullWidth: false,
                  onPressed: onAccept,
                )
              else
                OutlinedButton(
                  onPressed: onAccept,
                  child: const Text('Accept'),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(height: 4),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 2),
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pickup,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      pickupArea,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      dropoff,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      dropoffArea,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.straighten, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(distance, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.schedule, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
