import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TcustomCurvedEdges(), child: child);
  }
}
