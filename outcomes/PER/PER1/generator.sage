class Generator(BaseGenerator):
    def data(self):
        #stuff for first item
        x   = var('x');
        s   = sample([2,3,5,7,11],3);
        p   = randrange(2,10)*choice([-1,1]);
        p0  = s[0]*choice([-1,1]);
        p1  = s[1]*choice([-1,1]);
        q   = s[2];

        #stuff for second item
        coeffs = sample(range(-30,31),3);
        powers = sample(range(0,15),3);
        r = choice([3,4,5]);
        n = choice(range(2,6));
        m = choice([5,6,7]);




        return {
            "inside1": p,
            "outside1": p0/q,
            "bottom1": p1/q,
            "answer1": p*p0/q - p1/q,

            "poly": (coeffs[0])*x^(powers[0])+(coeffs[1])*x^(powers[1])+(coeffs[2])*x^(powers[2]),
            "root": r,
            "inside2": n,
            "bottom2": m/r,
            "answer2": n/r-m/r,
        }
