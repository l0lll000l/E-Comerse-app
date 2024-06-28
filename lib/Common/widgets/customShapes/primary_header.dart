import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/circular_container.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/curved_edge_widget.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class PrimaryHeader extends StatelessWidget {
  const PrimaryHeader({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        padding: const EdgeInsets.all(0),
        color: TColors.primary,
        child: SizedBox(
          // height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.light.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
