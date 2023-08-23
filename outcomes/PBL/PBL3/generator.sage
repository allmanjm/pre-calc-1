class Generator(BaseGenerator):
    def data(self):
        
        x = var('x');
        rts = sample(range(-15,16),2);
        inside  = choice([-1,1])*(x-rts[0])*(x-rts[1]);
        outside = choice(["sqroot","rec_sqroot","rec","rec_cbroot"]);

        # let's get the LaTeX formatting correct 
        # for the displayed equation in the prompt
        if outside == "sqroot":
            l_LaTeX = "\\sqrt{ "
            r_LaTeX = ' } '
            sol = solve(inside>=0,x)
        elif outside == "rec_sqroot":
            l_LaTeX = "\\frac{1}{ \\sqrt{ "
            r_LaTeX = ' } } '
            sol = solve(inside>0,x)
        elif outside == "rec":
            l_LaTeX = "\\frac{1}{ "
            r_LaTeX = ' } '
        else:
            l_LaTeX = "\\frac1{ \\sqrt[3]{ "
            r_LaTeX = ' } } '

        
        # let's build intervals
        a = min(rts);
        b = max(rts);
        s = inside.coefficients(sparse=False)[-1] #coeff of x^2 for inside function

        if s>0:
            if outside == "sqroot":
                interval_notation = "(-\\infty," + str(a) + "] \\cup [" +str(b) + ",\\infty)"
            elif outside == "rec_sqroot":
                interval_notation = "(-\\infty," + str(a) + ") \\cup (" +str(b) + ",\\infty)"
            else:
                interval_notation = "(-\\infty," + str(a) + ") \\cup (" + str(a) + "," + str(b) + ") \\cup (" + str(b) + ",\\infty)"
        else:
            if outside == "sqroot":
                interval_notation = "[" + str(a) + "," + str(b) + "]"
            elif outside == "rec_sqroot":
                interval_notation = "(" + str(a) + "," + str(b) + ")"
            else:
                interval_notation = "(-\\infty," + str(a) + ") \\cup (" + str(a) + "," + str(b) + ") \\cup (" + str(b) + ",\\infty)"
    
        # now we draw the intervals
        d = b-a;
        tickmarks = [a,b];
        eps = 3*d/120;

        if s>0:
            if outside == "sqroot":
                eps = 3*d/120;
                int_gr = plot(0,(a-d,a-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(b+eps,b+d), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps, fill = True)
                int_gr += circle((b,0), eps, fill = True)
                int_gr += point((a-d,0), pointsize = 50, marker = "<")
                int_gr += point((b+d,0), pointsize = 50, marker = ">")
            elif outside == "rec_sqroot":
                eps = 3*d/120;
                int_gr = plot(0,(a-d,a-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(b+eps,b+d), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps)
                int_gr += circle((b,0), eps)
                int_gr += point((a-d,0), pointsize = 50, marker = "<")
                int_gr += point((b+d,0), pointsize = 50, marker = ">")
            else:
                eps = 3*d/120;
                int_gr = plot(0,(a+eps,b-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(a-d,a-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(b+eps,b+d), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps)
                int_gr += circle((b,0), eps)
                int_gr += point((a-d,0), pointsize = 50, marker = "<")
                int_gr += point((b+d,0), pointsize = 50, marker = ">")
        else:
            if outside == "sqroot":
                eps = d/120;
                int_gr = plot(0,(a+eps,b-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps, fill = True)
                int_gr += circle((b,0), eps, fill = True)
            elif outside == "rec_sqroot":
                eps = d/120;
                int_gr = plot(0,(a+eps,b-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps)
                int_gr += circle((b,0), eps)
            else:
                eps = 3*d/120;
                int_gr = plot(0,(a+eps,b-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(a-d,a-eps), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps)
                int_gr += plot(0,(b+eps,b+d), thickness = 1.5, aspect_ratio = 1,ymin=-1.2*eps,ymax=1.2*eps,ticks=[tickmarks,[]])
                int_gr += circle((a,0), eps)
                int_gr += circle((b,0), eps)
                int_gr += point((a-d,0), pointsize = 50, marker = "<")
                int_gr += point((b+d,0), pointsize = 50, marker = ">")

        
        
        return {
            "l_LaTeX": l_LaTeX,
            "r_LaTeX": r_LaTeX,
            "inside": expand(inside),
            "int_not": interval_notation,
            "int_gr": int_gr,
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": data["int_gr"],
        }
