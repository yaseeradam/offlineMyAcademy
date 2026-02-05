import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartlink/core/theme/app_theme.dart';
import 'package:smartlink/core/widgets/smart_button.dart';
import 'package:smartlink/core/widgets/smart_input.dart';

class EditStorefrontScreen extends StatelessWidget {
  const EditStorefrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Storefront'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(), // Save logic
            child: const Text('Save', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Public Profile', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Your store is currently live', style: TextStyle(color: AppTheme.primaryColor, fontSize: 12)),
                  ],
                ),
                Switch(value: true, onChanged: (val) {}, activeColor: AppTheme.primaryColor),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Cover Photo
          Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDKkgYjO9YQURC3hhcwmBvCXCcSsSeqco9NwH7gpAQOsoWeYlWJP6h6z8U_HuYkWU1PVXlXbxTLW5F6vUgliuDC0zFrU4JKtF385Kq6P8mUnj9tacb064t424vjVXWEZwNfmj1mxjKLdFDDLg8sqZITvD5X-yjq64es9mYOw1_p_qzxQc5nVA4Jeio3j8RIPU-Uj6K9IaAumoVtxfZ6dCm5jgkGU-DFr5L36XGUHHbCVyzUzeQ-48DVmuZekD4M2ppc1Uc04UAZ1ruk'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.black),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Cover Photo', style: TextStyle(fontWeight: FontWeight.bold)),
          const Text('This will be the first thing customers see.', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 24),
          const SmartInput(hintText: 'Store Name', controller: null), // Pre-fill with "Green Leaf Café"
          const SizedBox(height: 16),
          const TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Tell customers about your shop...',
              labelText: 'Description',
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Gallery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_circle, size: 16),
                label: const Text('Add'),
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid), // Dashed preferred
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add_a_photo, color: Colors.grey),
                      Text('Upload', style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuDN81ayMuEgjQ1EiVUC12uXj8KJrXPyqXQkFVJLetzIzmu3TMJZThQTOBpdqSBtuK-LDra0qbt2BT_L5je9GPCW9s98xiRS7A3oAJDjtwIP1ghss06-Ym7CcZqc-PSjlINkEz1TqB_FAqNgcubyTkNchGt7fvMbXxQ0gZcTiY_o9tiYWXFnFIARUHDZQi30fst29tkfcqd0E__INbMzsJRMagz9vpUqyxNNfRAqt211PWH66EI_2Ux9gwWHNppb_ZxFIP9IrIX0fZrs', width: 100, height: 100, fit: BoxFit.cover),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuCxWW8j0QnOg3bGbaA4K3MI5QaVBUChTVSDiAjlYa201OsnHR3_nRKYyAhzriNUPSewHTWEnuC6Mp9pEU1MOjzlw9NW__hJ2K8J-IRnDEpVjXbPZibko9BNKmErX6OpX9OiGEjwGCi2T24yt_U8ZQSIJ73bc7acApaxULHoKFu8iAANYnyjytiGY8cu_lkR3aTNROv9tq9qMJVFmuAYVfrU5IeAtQjAuIFSCtt5GO4YneWyfpIFqPTAEGLx17GC2OAa1P94mRpajtf7', width: 100, height: 100, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('Business Hours', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _BusinessHourRow(day: 'Mon', open: '09:00 AM', close: '05:00 PM'),
          _BusinessHourRow(day: 'Tue', open: '09:00 AM', close: '05:00 PM'),
          _BusinessHourRow(day: 'Sun', isClosed: true),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade200)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SmartButton(
              label: 'Preview Storefront',
              style: SmartButtonStyle.outline,
              icon: Icons.visibility,
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            SmartButton(
              label: 'Save Changes',
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BusinessHourRow extends StatelessWidget {
  final String day;
  final String? open;
  final String? close;
  final bool isClosed;

  const _BusinessHourRow({
    required this.day,
    this.open,
    this.close,
    this.isClosed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(day, style: const TextStyle(fontWeight: FontWeight.bold))),
          if (isClosed)
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text('Closed', style: TextStyle(color: Colors.red))),
              ),
            )
          else
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text(open!)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('-'),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text(close!)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
