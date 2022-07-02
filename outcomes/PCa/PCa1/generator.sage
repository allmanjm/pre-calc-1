class Generator(BaseGenerator):
    def data(self):

        x,h = var('x,h')


        #stuff for first item
        terms = sample([cos(x),sin(x),tan(x),log(x),exp(x),x],2);
        A = terms[0];
        B = terms[1];
        d = randrange(2,6);
        dd = d-1;

        #stuff for second item
        n = choice([2,3,4]);
        top = sum(binomial(n,i)*x^i*h^(n-i) for i in [0..n]);
        ans = sum(binomial(n,i)*x^i*h^(n-i-1) for i in range(n));
        


        #stuff for the third item
        a = randrange(1,5);
        c = randrange(1,4);
        r = floor(sqrt(4*c));
        b = randrange(-r+1,r);
        irred = x^2 + b*x + c;
        first_deriv_num = a*b*x^2 + 2*a*c*x;
        second_deriv_num = expand(2*a*(c^2-3*c*x^2-b*x^3));

        p1 = randrange(2,7);
        p2 = randrange(4,10);




        return {
            "A": A,
            "B": B,
            "d": d,
            "dd": dd,
            
            "n": n,
            "top": top,
            "ans": ans,

            "a": a,
            "b": b,
            "c": c,
            "irred": irred,
            "2ax": 2*a*x,
            "ax^2": a*x^2,
            "2x+b": 2*x+b,
            "funny": 2*a*b*x+2*a*c,
            "fdn": first_deriv_num,
            "sdn": second_deriv_num,
            "p1": p1,
            "p2": p2,
            "p3": p2-1,
        }
