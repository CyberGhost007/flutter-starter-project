// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

import './dynamic_link_text.dart';

class DynamicText extends StatelessWidget {
  const DynamicText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.maxlines,
    this.wrapWords = true,
    this.softwrap = false,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0),
    this.height = 1.0,
    this.closeText = false,
    this.italic = false,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final double fontSize;
  final double height;
  final bool wrapWords;
  final Color color;
  final bool softwrap;
  final int? maxlines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final bool closeText;
  final bool italic;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    //comfortaa
    //nunito
    //DMSans
    //Inter
    //ProductSan
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Text(
          text ?? '',
          style: GoogleFonts.nunito(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            height: height,
            fontStyle: italic ? FontStyle.italic : FontStyle.normal,
            decoration:
                closeText ? TextDecoration.lineThrough : TextDecoration.none,
          ),
          overflow: overflow,
          softWrap: softwrap,
          textAlign: textAlign,
          maxLines: maxlines,
        ),
      ),
    );
  }
}

class DynamicTextLink extends StatelessWidget {
  const DynamicTextLink({
    required Key key,
    required this.text,
    this.fontSize = 14,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.linkColor = Colors.blue,
    this.tagColor = Colors.orange,
    this.maxlines = 1,
    this.wrapWords = true,
    this.softwrap = false,
    this.textAlign = TextAlign.start,
    this.padding = const EdgeInsets.all(0),
    this.height = 1.0,
    this.closeText = false,
    this.italic = false,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final bool closeText;
  final bool italic;
  final bool wrapWords;
  final Color color;
  final Color linkColor;
  final Color tagColor;
  final bool softwrap;
  final int maxlines;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DynamicLinkText(
        text: text,
        style: GoogleFonts.nunito(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          height: height,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          decoration:
              closeText ? TextDecoration.lineThrough : TextDecoration.none,
        ),
        linkStyle: GoogleFonts.nunito(
          fontSize: fontSize,
          color: linkColor,
          fontWeight: fontWeight,
          height: height,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          decoration:
              closeText ? TextDecoration.lineThrough : TextDecoration.none,
        ),
        tagStyle: GoogleFonts.nunito(
          fontSize: fontSize,
          color: tagColor,
          fontWeight: fontWeight,
          height: height,
          fontStyle: italic ? FontStyle.italic : FontStyle.normal,
          decoration:
              closeText ? TextDecoration.lineThrough : TextDecoration.none,
        ),
        onOpen: (url) {},
        onTagClick: (String url) {},
        onUserTagClick: (String url) {},
      ),
    );
  }
}
