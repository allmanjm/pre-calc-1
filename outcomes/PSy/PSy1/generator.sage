class Generator(BaseGenerator):
    def data(self):
        
        x,A,B,C = var('x,A,B,C');

        d = randrange(1,15)*choice([-1,1])

        p = choice([3,4,5]);
        s = sample(range(3,10),3);
        q = choice([-1,1])*s[0];
        a = s[1]*choice([-1,1]);
        b = s[2];
        trans = sample([sin,cos,sec,exp,log],2);
        f(x) = trans[0](x);
        g(x) = trans[1](x);
        fprime(x) = derivative(f(x),x);
        gprime(x) = derivative(g(x),x);

        p1 = p-1;
        q1 = q-1;
        a1 = a-1;
        b1 = b-1;

        rhs = a*A^a1*B^b + b*A^a*B^b1;
        lhs2 = C*fprime(B)*g(A) + f(B)*gprime(A);
        lhs_fact = A^p+d;
        lhs1 = q*(lhs_fact)*B^q1*C + p*A^p1*B^q;
        lhs = lhs1 + lhs2; 

        sol = solve(lhs == rhs, C);

        # this problem is equivalent to solving for y'
        # when computing the implicit derivative of
        # the curve cut out by the equation
        # (x^p+d)y^q + f(y)g(x) = x^a y^b

        
        
        
        return {
            "rhs": rhs,
            "lhs2": lhs2,
            "lhs_fact": lhs_fact,
            "q": q,
            "q1": q1,
            "p": p,
            "p1": p1,
            "answer": sol[0],
        }