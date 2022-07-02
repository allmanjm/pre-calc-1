class Generator(BaseGenerator):
    def data(self):

        x   = var('x');

        #stuff for first item
        coeffs = sample(list(range(1,15))+list(range(-15,0)),4);
        w = randrange(1,10);
        powers = [randrange(2,6) for i in range(2)];

        factor1 = x^(powers[0]);
        factor2 = coeffs[0]*x + coeffs[1];
        factor3 = coeffs[2]*x + coeffs[3];
        factor4 = x^2-w^2;

        zero1 = 0;
        zero2 = Rational(-coeffs[1]/coeffs[0]);
        zero3 = Rational(-coeffs[3]/coeffs[2]);
        zero4 = w;
        zero5 = -w;

        #stuff for second item
        cc = sample(list(range(1,15))+list(range(-15,0)),4);
        c = randrange(1,5);
        b = randrange(0,floor(sqrt(4*c)));
        r = randrange(2,6)*choice([-1,1]);

        f1 = x+cc[0];
        f2 = x+cc[1];
        f3 = x+cc[2];
        f4 = x+cc[3];
        f5 = x^2 + b*x + c; #an extra irred. quad. factor that doesn't effect the answer

        f = x^r*f1*f2 / (f3*f4);
        z_sol = solve(f==0,x);
        u_sol = solve(1/f == 0,x);
        zn = len(z_sol);
        un = len(u_sol);

        zero_str = str(z_sol[0]).replace('x == ' , '')
        i=1
        while i<zn:
            zero_str=zero_str+str(z_sol[i]).replace('x ==',' or ')
            i += 1

        und_str = str(u_sol[0]).replace('x ==', '')
        j=1
        while j<un:
            und_str=und_str+str(u_sol[j]).replace('x ==',' or ')
            j += 1



        #stuff for the third item
        ccc = sample(list(range(1,15))+list(range(-15,0)),4);
        num_fact = expand((x-ccc[0])*(x-ccc[1]));
        denom_fact = expand((x-ccc[2])*(x-ccc[3]));
        C = randrange(1,5);
        B = randrange(0,floor(sqrt(4*C)));
        extra = x^2 + B*x + C; #another superfluous irred. quad.
        pq = sample([2,3,5,7,11],2);
        rr = choice([-1,1])*pq[0]/pq[1];

        g = x^rr*num_fact/denom_fact;
        zz_sol = solve(g==0,x);
        uu_sol = solve(1/g == 0,x);
        zzn = len(zz_sol);
        uun = len(uu_sol);

        zz_str = str(zz_sol[0]).replace('x == ' , '')
        h=1
        while h<zzn:
            zz_str=zz_str+str(zz_sol[h]).replace('x ==',' or ')
            h += 1

        uu_str = str(uu_sol[0]).replace('x ==', '')
        k=1
        while k<uun:
            uu_str=uu_str+str(uu_sol[k]).replace('x ==',' or ')
            k += 1




        return {
            "factor1": factor1,
            "factor2": factor2,
            "factor3": factor3,
            "factor4": factor4,
            "power": powers[1],
            "zero1": zero1,
            "zero2": zero2,
            "zero3": zero3,
            "zero4": zero4,
            "zero5": zero5,

            "f1": f1,
            "f2": f2,
            "f3": f3,
            "f4": f4,
            "f5": f5,
            "r" : r,
            "zeros_answer": zero_str,
            "und_answer": und_str,

            "num_fact": num_fact,
            "denom_fact": denom_fact,
            "extra": extra,
            "rr": rr,
            "zz_answer": zz_str,
            "uu_answer": uu_str,
        }
