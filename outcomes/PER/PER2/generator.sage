class Generator(BaseGenerator):
    def data(self):
        #stuff for first item
        s=sample([2,3,5,7],2);
        p=s[0]*choice([1,-1]);
        q=s[1];
        b=choice([2,3]);
        
        #stuff for second item
        x=var('x');
        qq=randrange(2,13);
        pp=choice([i for i in range(1,21) if gcd(i,qq) == 1])*choice([-1,1])
        n=qq*choice([2,3,4,5]);

        #stuff for third item
        bb=choice([2,3,5,1/2,1/3,1/5]);
        qqq=choice([2,3]);
        ppp=choice([5,7])*choice([-1,1]);
        B=bb^(qqq);
        nn=qqq*choice([2,3,4,5]);




        return {
            "base1": b^q,
            "powernum1": p,
            "powerden1": q,
            "answer1": b^p,
            "base2": x^n,
            "powernum2": pp,
            "powerden2": qq,
            "answer2": x^(n*pp/qq),
            "base3": B*x^nn,
            "powernum3": ppp,
            "powerden3": qqq,
            "answer3": B^(ppp/qqq)*x^(nn*ppp/qqq),
        }
