class Generator(BaseGenerator):
    def data(self):
        
        #stuff for first item
        x,u = var('x,u');
        d = randrange(2,10);
        f(x) = x^d;
        g(x) = choice([sin(x),cos(x),tan(x),exp(x),sec(x),cot(x)]);
        L = [
                [f(x)+g(x),'Sum'],
                [f(x)-g(x),'Difference'],
                [f(x)*g(x),'Product'],
                [f(x)/(g(x)+randrange(1,10)*choice([1,-1])),'Quotient'],
                [g(f(x)),'Composition']
            ];
        s = sample(L,3);

        #stuff for second item
        F(x)=choice([sin(x),sec(x),cos(x),tan(x),csc(x),cot(x),exp(x)]);
        p0 = randrange(2,10);
        fr = sample([2,3,5,7],2);
        r = fr[0]/fr[1];
        G(x)=x^p0;
        K(x)=x^r;
        H(x)=(choice([2,3])*x+choice([1,5,7,11,13])*choice([-1,1]));
        LL = [
            [G(x)*F(x)+K(x)*G(H(x)),'SUM with TERMS:', [ K(x)*G(H(x)), G(x)*F(x)]],
            [G(H(x))*F(H(x)),'PRODUCT with FACTORS:',[G(H(x)), F(H(x))]],
            [F(K(x))+K(H(x)),'SUM with TERMS:', [F(K(x)), K(H(x))]],
            [K(H(x)),'COMPOSITION with INSIDE and OUTSIDE:', [H(x) , K(u)]],
            [F(G(x)),'COMPOSITION with INSIDE and OUTSIDE:', [G(x), F(u)]]
        ];
        ss = sample(LL,3);


        return {
            "prompt11": s[0][0], 
            "answer11": s[0][1],
            "prompt12": s[1][0], 
            "answer12": s[1][1],
            "prompt13": s[2][0], 
            "answer13": s[2][1],

            "prompt21": ss[0][0],
            "prompt22": ss[1][0],
            "prompt23": ss[2][0],
            "answer21": ss[0][1],
            "answer22": ss[1][1],
            "answer23": ss[2][1],
            "part211": ss[0][2][0],
            "part212": ss[0][2][1],
            "part221": ss[1][2][0],
            "part222": ss[1][2][1],
            "part231": ss[2][2][0],
            "part232": ss[2][2][1],
       }
