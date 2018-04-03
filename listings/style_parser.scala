private def styleVariable = ("""(""" + Style.validStyleAttributes.map(_ + "|").mkString + """)""").r ^^ { _.toString }
private def styleAttribute = styleVariable ~ (rgbArgument | gradientArgument | arguments) ^^ { case v ~ a => (v, a) }
private def rgbArgument = "\\s*=\\s*RGB\\s*\\(.+\\)".r ^^ { _.toString }
private def gradientArgument = "(s?)\\s*=\\s*gradient.+\\{[^\\{\\}]*\\}".r ^^ { _.toString }
private def style: Parser[Style] =
  ("style" ~> ident) ~ (("extends" ~> rep(ident <~ ",?".r))?) ~ ("{" ~> rep(styleAttribute)) <~ "}" ^^ {
    case name ~ parents ~ attributes => Style(name, parents, attributes, cache)
  }
private def styles = rep(style)
def parseStyle(input: String) = parseAll(styles, trimRight(input)).get
