import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularButton<T> extends StatefulWidget {
  final String text;
  final T value;
  final T groupValue;
  final EdgeInsetsGeometry padding;
  final Color color;
  final TextStyle textStyle;
  final Function onTap;

  const CircularButton(this.text,
      {Key key,
      @required this.value,
      @required this.groupValue,
      this.padding,
      this.color,
      this.textStyle,
      this.onTap})
      : super(key: key);

  @override
  _CircularButtonState<T> createState() => _CircularButtonState<T>();
}

class _CircularButtonState<T> extends State<CircularButton<T>> {
  _isSelected() {
    return widget.value == widget.groupValue;
  }

  _getText(BuildContext context) {
    Color currentColor = widget.color ?? Theme.of(context).primaryColor;
    Color textColor = _isSelected() ? Colors.white : currentColor;
    TextStyle textStyle;
    if (widget.textStyle == null) {
      textStyle = TextStyle(
        fontFamily: "SCDream",
        color: textColor,
        fontWeight: FontWeight.w500,
      );
    }
    else {
      textStyle = widget.textStyle.copyWith(color: textColor);
    }

    return Text(widget.text, style: textStyle);
  }

  _getPadding(Widget current) {
    if (widget.padding == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 22.0,
          vertical: 8.0,
        ),
        child: current,
      );
    }

    return Padding(
      padding: widget.padding,
      child: current,
    );
  }

  _getDecoration(BuildContext context) {
    Color currentColor = widget.color ?? Theme.of(context).primaryColor;
    Color backgroundColor = _isSelected() ? currentColor : Colors.white;

    return BoxDecoration(
      color: backgroundColor,
      shape: BoxShape.rectangle,
      border: Border.all(color: currentColor, width: 1.0),
      borderRadius: BorderRadius.circular(
        MediaQuery.of(context).size.width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget current = _getText(context);

    current = _getPadding(current);

    return Container(
      decoration: _getDecoration(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.width,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Center(
              child: current,
            ),
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}
