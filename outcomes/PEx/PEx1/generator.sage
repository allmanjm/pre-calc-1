class Generator(BaseGenerator):
    def data(self):
        #stuff for first item
        x   = var('x');
        b = randrange(2,8)*choice([-1,1]);
        c = randrange(1,8);
        sampsign = choice([-1,1]);
        samp1 = sample(range(1,9),2);
        samp2 = sample(range(2,9),2);
        samppower = sample(range(1,7),2);
        diff2sq0 = x+sampsign*c;
        diff2sq1 = x-sampsign*c;
        square = x + b;
        factor1 = choice([-1,1])*samp1[0]*x^(samppower[0])+samp1[1]*choice([-1,1]);
        factor2 = choice([-1,1])*samp2[0]*x^(samppower[1])+samp2[1]*choice([-1,1]);
        expand_diff2sq = expand((x-c)*(x+c));
        expand_square = expand((x+b)*(x+b));
        expand1 = expand(factor1*factor2);

        #stuff for second item
        a = var('a');
        h = var('h');
        d = sample([3,4,5],2);
        d1 = d[0];
        expand2 = expand((a+h)^d1);


        #stuff for the third item
        d2 = d[1];
        y = var('y');
        factor3 = randrange(1,4)*choice([-1,1])*x.power(randrange(1,4)) + randrange(1,4)*y.power(randrange(0,4));
        expand3 = expand(factor3^d2)




        return {
            "factor1": factor1,
            "factor2": factor2,
            "expand1": expand1,
            "d1": d1,
            "expand2": expand2,
            "d2": d2,
            "factor3": factor3,
            "expand3": expand3,
        }
