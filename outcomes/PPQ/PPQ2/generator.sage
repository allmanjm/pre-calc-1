class Generator(BaseGenerator):
    def data(self):
        
        x = var('x');
        s = sample(range(1,9),3);
        a = s[0]*choice([-1,1]);
        b = s[1]*choice([-1,1]);
        c = s[2];

        p = choice(["","2","3"]);
        q = choice(["","2","3"]);
        r = choice(["","2","3"]);

        power_dict = {"":1,"2":2,"3":3};

        tickmarks = sorted([a,b,c,-c,0]);

        m = min(tickmarks) - 3;
        M = max(tickmarks) + 3;

        test_pts = [(m+tickmarks[0])/2];
        i=1;
        while i<len(tickmarks):
            test_pts += [(tickmarks[i-1]+tickmarks[i])/2]
            i += 1

        test_pts += [(tickmarks[4]+M)/2];

        d = M-m;
        eps = d/120;

        f(x) = x^(power_dict[p])*(x-a)^(power_dict[q])*(x-b)^(power_dict[r])/(c^2-x^2);

        pos_pts = [];
        neg_pts = [];

        for t in test_pts:
            if f(t)>0:
                pos_pts += [(t,0.75*eps)]
            else:
                neg_pts += [(t,0.75*eps)]



        #sign_chart = plot(0, (m,M), ticks = [tickmarks,[]], ymin = -1.2*eps, ymax = 1.2*eps, aspect_ratio = 1);
        #sign_chart += point(pos_pts, size = 35, marker = "$+$");
        #sign_chart += point(neg_pts, size = 35, marker = "$-$");
        #sign_chart += point((m,0), size = 50, marker = "<");
        #sign_chart += point((M,0), size = 50, marker = ">");


        ineq_less = "f(x) < 0";
        ineq_more = "f(x) > 0";




        return {
            "p": p,
            "q": q,
            "r": r,
            "x-a": x-a,
            "x-b": x-b,
            "c2": c^2,
            "ineq_less": ineq_less,
            "ineq_more": ineq_more,
            "m":m,
            "M":M,
            "tm":tickmarks,
            "e":eps,
            "pp":pos_pts,
            "np":neg_pts,
        }
    
    @provide_data
    def graphics(data):

        return {
            "Show1": plot(0, (data["m"],data["M"]), ticks = [data["tm"],[]], ymin = -1.2*data["e"], ymax = 1.2*data["e"], aspect_ratio = 1) + point(data["pp"], size = 35, marker = "$+$")+point(data["np"], size = 35, marker = "$-$")+point((data["m"],0), size = 50, marker = "<")+point((data["M"],0), size = 50, marker = ">"),
        }
