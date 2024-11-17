import 'package:flutter/material.dart';

class GradientHeader extends StatefulWidget {
  const GradientHeader({
    super.key,
    this.text = const SizedBox(),
    this.subChild = const SizedBox(),
    this.training,
    this.hasBackButton = true,
    this.function,
  });

  final Widget text;
  final Widget subChild;
  final Widget? training;
  final bool? hasBackButton;
  final Function? function;

  @override
  State<GradientHeader> createState() => _GradientHeaderState();
}

class _GradientHeaderState extends State<GradientHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xFF5CDAE8), // Start color
              Color(0xFF547BFE), // End color
            ],
            stops: [0.0576, 0.5045], // Adjust stops based on the percentages
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          padding: const EdgeInsets.only(
            left: 10,
            right: 5,
            top: 40,
            bottom: 5,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(widget.hasBackButton == false ? 8 : 0),
                child: Row(
                  children: [
                    if (widget.hasBackButton == true) ...[
                      IconButton(
                        icon: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () => widget.function != null ? widget.function?.call() : Navigator.pop(context),
                        padding: EdgeInsets.zero,
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.zero),
                        ),
                      ),
                    ],
                    Expanded(child: widget.text),
                    widget.training ?? const SizedBox()
                  ],
                ),
              ),
              widget.subChild
            ],
          ),
        ),
      ],
    );
  }
}
