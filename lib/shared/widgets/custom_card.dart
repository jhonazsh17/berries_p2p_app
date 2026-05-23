import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget child;
  final String? title;
  final VoidCallback? onTap;
  final bool? withMarginBottom;
  
  const CustomCard({super.key, required this.child, this.title, this.onTap, this.withMarginBottom});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: widget.withMarginBottom == true ? EdgeInsets.only(bottom: 16) : EdgeInsets.zero,
        elevation: 1,
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.title != null)
                  ...[
                    Text(widget.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(height: 8),
                  ],
                widget.child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}