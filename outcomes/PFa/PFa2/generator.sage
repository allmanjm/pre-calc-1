class Generator(BaseGenerator):
    def data(self):
        
        A=choice([sin(x),cos(x),sec(x),tan(x),exp(x),ln(x),cot(x),csc(x),arctan(x)]);
        n=randrange(1,10);
        s=sample([2,3,5,7],2);
        r=s[0]/s[1];
        bp=choice([n,r]);
        B=x^bp;
        cp=randrange(3,5);
        C=choice([2,4,6,8,10])*x+(2*randrange(1,10)-1)*choice([-1,1]);
        dB=choice([0,1,2]);
        Bs=x^(bp+dB);
        dC=choice([-1,0,1]);
        cps=cp+dC;
        coeffs=sample(range(2,12),2);
        c0=coeffs[0]*choice([-1,1]);
        c1=coeffs[1];
        fact_express = factor(c0*A^2*B*C^cp + c1*A*Bs*C^(cp+dC));


        return {
            "trans": A,
            "mono": B,
            "mono_s": Bs,
            "binom": C,
            "binomP": cp,
            "binomP_s": cps,
            "c0": c0,
            "c1": c1,
            "factored": fact_express
        }
