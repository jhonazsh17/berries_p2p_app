import 'package:flutter/material.dart';
import 'package:berries_p2p_app/core/theme/app_colors.dart';
import 'package:berries_p2p_app/features/home/presentation/widgets/custom_avatar.dart';

class CustomBoxItem extends StatelessWidget {
  const CustomBoxItem({super.key, this.withPaddingBottom, this.onTap});

  final bool? withPaddingBottom;
  final VoidCallback? onTap;
  final Color _colorPrimary = AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: withPaddingBottom == true ? 16 : 0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding( 
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _avatar(),
              _mainInfo(),
              _sideInfo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatar() {
    return CustomAvatar();
  }

  Widget _mainInfo() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monkey D. Luffy', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text('4.8 (100)', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
            SizedBox(height: 4),
            Chip(
              label: Text('Quiere efectivo', style: TextStyle(fontSize: 12, color: _colorPrimary)), 
              backgroundColor: Colors.green[50]!, 
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              side: BorderSide.none,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sideInfo() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.location_on, color: Colors.red, size: 16),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text('A 0.5 km de tí', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'S/. 50.00', 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 22, 
              color: _colorPrimary
            ),
          ),
        ],
      ),
    );
  }
}
