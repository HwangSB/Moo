import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moo/screens/question_post.dart';

class CircularButton<T> extends StatefulWidget {
  final String text;
  final T value;
  final T groupValue;
  final EdgeInsetsGeometry padding;
  final Color color;
  final TextStyle textStyle;
  final Function onTap;
  final bool multichoice;

  CircularButton(this.text,
      {Key key,
      @required this.value,
      @required this.groupValue,
      this.padding,
      this.color,
      this.textStyle,
      this.onTap,
      this.multichoice = false})
      : super(key: key);

  @override
  _CircularButtonState<T> createState() => _CircularButtonState<T>();
}

class _CircularButtonState<T> extends State<CircularButton<T>> {
  List selectedList = [];
  bool check = false;
  bool clicked = false;

  _isSelected() {
    if (!widget.multichoice) {
      return widget.value == widget.groupValue;
    } else {
      if (!clicked) {
        if (widget.value == widget.groupValue) {
          clicked = true;
          selectedList.add(widget.value);
        }
      } else {
        if (widget.value == widget.groupValue) {
          clicked = false;
          selectedList.remove(widget.value);
        }
      }

      return selectedList.contains(widget.value);
    }
  }

  _getText(BuildContext context) {
    Color currentColor = widget.color ?? Theme.of(context).primaryColor;
    Color textColor = check ? Colors.white : currentColor;

    TextStyle textStyle;
    if (widget.textStyle == null) {
      textStyle = TextStyle(
        fontFamily: "SCDream",
        color: textColor,
        fontWeight: FontWeight.w500,
      );
    } else {
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
    Color backgroundColor = check ? currentColor : Colors.white;

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
    check = _isSelected();
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
