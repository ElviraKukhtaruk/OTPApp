import 'package:flutter/material.dart';
import 'package:otp_app/widgets/pages/qr_code/qr_scanner.dart';
import 'package:otp_app/widgets/pages/add_otp/add_otp.dart';
import 'dart:math' as math;


final GlobalKey<_ExpandableFabState> expandableFabKey = GlobalKey<_ExpandableFabState>();

@immutable
class AddExpandableFab extends StatelessWidget {
  const AddExpandableFab({super.key});

  void _showAction(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const addOTP()),
        );
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const scanQR()),
        );
    }
    
  }

  @override
  Widget build(BuildContext context) {
    
    return ExpandableFab(
      distance: 80,
      children: [
        ActionButton(
          onPressed: () { 
            _showAction(context, 0);
          },
          icon: const Icon(Icons.create),
        ),
        ActionButton(
          onPressed: () {
            _showAction(context, 1);
          },
          icon: const Icon(Icons.qr_code),
        )
      ],
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  ExpandableFab({
    Key? key,
    this.initialOpen,
    required this.distance,
    required this.children,
  }) : super(key: key ?? expandableFabKey);

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
  // Static instance to track the current instance of ExpandableFabState
  static _ExpandableFabState? instance;
  
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool open = false;

  bool get isOpen => open;

  @override
  void initState() {
    super.initState();
    instance = this;
    open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    instance = null;
    _controller.dispose();
    super.dispose();
  }

  void toggle() {
    setState(() {
      open = !open;
      if (open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return FloatingActionButton(
      onPressed: toggle,
      child: const Icon(Icons.close)
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: ActionButton(
            onPressed: () {
              // Call the passed action and toggle the FAB state
              (widget.children[i] as ActionButton).onPressed();
              toggle(); // Collapse the FAB after action
            },
            icon: (widget.children[i] as ActionButton).icon,
          ),
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            heroTag: "btn1",
            onPressed: toggle,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.icon
  });

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: Color(0xFF141e30),
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Colors.white,
      ),
    );
  }
}
