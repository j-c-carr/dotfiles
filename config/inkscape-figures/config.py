def latex_template(name, title):
    return '\n'.join((rf"\tfig[1]{{{name}}}",
        rf"{{  }}"))

