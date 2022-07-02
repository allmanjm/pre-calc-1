class Generator(BaseGenerator):
    def data(self):
        #stuff for first item
        x   = var('x');
        r1   = randrange(1,12)*choice([-1,1]);
        r2   = randrange(0,12)*choice([-1,1]);
        factor11 = x-r1;
        factor12 = x-r2;
        poly1 = expand((x-r1)*(x-r2));
        
        #stuff for second item
        s = sample(range(1,5),2);
        a0 = randrange(1,9)*choice([-1,1]);
        a1 = randrange(1,9)*choice([-1,1]);
        factor21 = choice([-1,1])*s[0]*x-a0;
        factor22 = s[1]*x-a1;
        poly2 = expand(factor21*factor22);


        return {
            "factor11": factor11,
            "factor12": factor12,
            "poly1": poly1,

            "factor21": factor21,
            "factor22": factor22,
            "poly2": poly2,
        }
