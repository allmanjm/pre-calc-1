class Generator(BaseGenerator):
    def data(self):
        
        x=var('x')

        #stuff for first item
        sl = Rational(randrange(1,9)/randrange(1,7)*choice([-1,1]));
        pt = tuple(randrange(-15,16) for i in range(2));
        ptx = pt[0];
        pty = pt[1];
        sl_int_ans1 = expand(pty + sl*(x-ptx));
        deltax = x - ptx;

        if sl<0:
            ans_sign1 = ""
        else:
            ans_sign1 = "+"
        
        
        #stuff for second item
        xcoords = sample(range(-9,10),2);
        ycoords = sample(range(-9,10),2);
        x0 = xcoords[0];
        x1 = xcoords[1];
        y0 = ycoords[0];
        y1 = ycoords[1];
        xm = min(xcoords);
        xM = max(xcoords);
        m = Rational((y0-y1)/(x0-x1));
        sl_int_ans2 = expand(y0+m*(x-x0));
        deltax0 = x-x0;
        deltax1 = x-x1;

        if m<0:
            ans_sign2 = ""
        else:
            ans_sign2 = "+"





        return {
            "slope": sl,
            "point": pt,
            "pty": pty,
            "xlim0": ptx-2,
            "xlim1": ptx+2,
            "sl_int_ans1": sl_int_ans1,
            "deltax": deltax,
            "ans_sign1": ans_sign1,

            "x0":x0,
            "x1":x1,
            "y0":y0,
            "y1":y1,
            "m": m,
            "xmin":xm-2,
            "xmax":xM+2,
            "sl_int_ans2": sl_int_ans2,
            "deltax0": deltax0,
            "deltax1": deltax1,
            "ans_sign2": ans_sign2,
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": point(data["point"],pointsize=20,color='blue') + plot(data["sl_int_ans1"],(x,data["xlim0"],data["xlim1"]),color='red'),
            "Show2": plot(data["y0"] + data["m"]*(data["deltax0"]),(x,data["xmin"],data["xmax"]),color = 'red') + point((data["x0"],data["y0"]),pointsize=20,color='blue') + point((data["x1"],data["y1"]),pointsize=20,color='blue'),
        }