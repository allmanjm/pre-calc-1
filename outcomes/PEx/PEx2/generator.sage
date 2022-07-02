class Generator(BaseGenerator):
    def data(self):
        #stuff for first item
        x = var('x');
        coeffs1 = [randrange(1,10)*choice([-1,1]) for i in range(2)];
        c13 = choice([0,randrange(1,6)*choice([-1,1])]);
        coeffs2 = [randrange(1,10)*choice([-1,1]) for i in range(3)];
        powers1 = sample(range(0,8),3);
        powers2 = sample(range(0,8),3);
        factor1 = coeffs1[0]*x^(powers1[0]) + coeffs1[1]*x^(powers1[1]) + c13*x^(powers1[2]);
        factor2 = coeffs2[0]*x^(powers2[0]) + coeffs2[1]*x^(powers2[1]) + coeffs2[2]*x^(powers2[2]);
        expandA = expand(factor1*factor2);


        #stuff for second item
        y = var('y');
        coeffs3 = [randrange(1,10)*choice([-1,1]) for i in range(2)];
        coeffs4 = [randrange(1,10)*choice([-1,1]) for i in range(3)];
        powers3 = sample(sample(range(0,8),2)+sample(range(0,8),2),4);
        powers4 = sample(sample(range(0,8),2)+sample(range(0,8),2)+sample(range(1,8),2),6);
        factor3 = coeffs3[0]*x^(powers3[0])*y^(powers3[1])+coeffs3[1]*x^(powers3[2])*y^(powers3[3]);
        factor4 = coeffs4[0]*x^(powers4[0])*y^(powers4[1])+coeffs4[1]*x^(powers4[2])*y^(powers4[3])+coeffs4[2]*x^(powers4[4])*y^(powers4[5]);
        expandB = expand(factor3*factor4)


        #stuff for third item
        coeffs5 = [randrange(1,10)*choice([-1,1]) for i in range(2)];
        coeffs6 = [randrange(1,10)*choice([-1,1]) for i in range(3)];
        powers5 = sample(range(0,5),2);
        powers6 = sample(range(1,5),3);
        trans = choice([sin(x),cos(x),exp(x)]);
        factor5 = coeffs5[0]*x^(powers5[0]) + coeffs5[1]*x^(powers5[1]);
        factor6 = coeffs6[0]*x^(powers6[0]) + coeffs6[1]*x^(powers6[1]) + coeffs6[2]*x^(powers6[2])*trans;
        expandC = expand(factor5 * factor6);
        




        return {
            "factor1": factor1,
            "factor2": factor2,
            "expandA": expandA,

            "factor3": factor3,
            "factor4": factor4,
            "expandB": expandB,

            "factor5": factor5,
            "factor6": factor6,
            "expandC": expandC,
        }
