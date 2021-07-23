import 'package:flutter/material.dart';
import 'package:tracktion/util/arrowClipper.dart';

class IconDropDown extends StatefulWidget {
  final List<Icon> icons;
  final BorderRadius? borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final ValueChanged<int> onChange;

  const IconDropDown({
    Key? key,
    required this.icons,
    this.borderRadius,
    this.backgroundColor = const Color(0xFFF67C0B9),
    this.iconColor = Colors.black,
    required this.onChange,
  })   : assert(icons != null),
        super(key: key);
  @override
  _IconDropDownState createState() => _IconDropDownState();
}

class _IconDropDownState extends State<IconDropDown>
    with SingleTickerProviderStateMixin {
  GlobalKey _key = LabeledGlobalKey("button_icon");
  bool isMenuOpen = false;
  Offset? buttonPosition;
  Size? buttonSize;
  OverlayEntry? _overlayEntry;
  BorderRadius? _borderRadius;
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _borderRadius = widget.borderRadius ?? BorderRadius.circular(4);
    super.initState();
  }

  @override
  void dispose() {
    if (isMenuOpen) closeMenu();

    _animationController!.dispose();
    super.dispose();
  }

  findButton() {
    var renderBox = _key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      buttonSize = renderBox.size;
      buttonPosition = renderBox.localToGlobal(Offset.zero);
    }
  }

  void closeMenu() {
    _overlayEntry?.remove();
    _animationController?.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController?.forward();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context)?.insert(_overlayEntry!);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: _borderRadius,
      ),
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.view_list,
          size: 32,
          progress: _animationController!,
        ),
        color: Colors.white,
        onPressed: () {
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
      ),
    );
  }

  OverlayEntry? _overlayEntryBuilder() {
    if (buttonSize != null && buttonPosition != null) return null;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition!.dy + buttonSize!.height,
          left: buttonPosition!.dx,
          width: buttonSize!.width,
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: ClipPath(
                    clipper: ArrowClipper(),
                    child: Container(
                      width: 17,
                      height: 17,
                      color: widget.backgroundColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: widget.icons.length * buttonSize!.height,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      borderRadius: _borderRadius,
                    ),
                    child: Theme(
                      data: ThemeData(
                        iconTheme: IconThemeData(
                          color: widget.iconColor,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(widget.icons.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              widget.onChange(index);
                              closeMenu();
                            },
                            child: Container(
                              width: buttonSize!.width,
                              height: buttonSize!.height,
                              child: widget.icons[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
