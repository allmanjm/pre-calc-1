class Generator(BaseGenerator):
    def data(self):
        
        x,y = var('x,y')

        #stuff for 1 or 2 real roots
        rr1 = randrange(-11,10);
        rr2 = choice([-1,1])*randrange(1,10);
        A = choice([-1,1])*randrange(1,5);
        
        freal = expand(A*(x-rr1)*(x-rr2));
        if rr1==rr2:
            numrealroots = 1;
            realrootslist = str(rr1);
        else:
            numrealroots = 2;
            realrootslist = str(rr2) + ", " + str(rr1);

        crit = (rr1+rr2)/2;
        freal_minmax = A*(crit-rr1)*(crit-rr2)

        realypad = abs(A)/8;
        realxpad = max(abs(rr1-rr2)/8,1/4);

        xrealmin = min([rr1,rr2])-realxpad;
        xrealmax = max([rr1,rr2])+realxpad;

        if A>0:
            yrealmin = freal_minmax-realypad;
            yrealmax = realypad;
        else:
            yrealmin = -realypad;
            yrealmax = freal_minmax + realypad;

        real_tuple = (freal,numrealroots,realrootslist,xrealmin,xrealmax,yrealmin,yrealmax);


        

        #stuff for 0 real roots
        a = randrange(-5,6);
        bsq = randrange(1,7);
        B = choice([-1,1])*randrange(1,5);

        fcomp = expand(B*(x^2-2*a*x+(a^2+bsq)));
        fcomp_minmax = B*(bsq)

        xcompmin = a-bsq;
        xcompmax = a+bsq;

        if B>0:
            ycompmin = 0;
            ycompmax = 2*fcomp_minmax;
        else:
            ycompmin = 2*fcomp_minmax;
            ycompmax = 0;

        comp_tuple = (fcomp,0,"~",xcompmin,xcompmax,ycompmin,ycompmax);

        mix = sample([real_tuple,comp_tuple],2);
        f1_tuple = mix[0];
        f2_tuple = mix[1];

        

        return {
            "f1": f1_tuple[0],
            "numroots1": f1_tuple[1],
            "roots1": f1_tuple[2],
            "xmin1": f1_tuple[3],
            "xmax1": f1_tuple[4],
            "ymin1": f1_tuple[5],
            "ymax1": f1_tuple[6],
            "f2": f2_tuple[0],
            "numroots2": f2_tuple[1],
            "roots2": f2_tuple[2],
            "xmin2": f2_tuple[3],
            "xmax2": f2_tuple[4],
            "ymin2": f2_tuple[5],
            "ymax2": f2_tuple[6],
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": plot(data["f1"],x,xmin=data["xmin1"],xmax=data["xmax1"],ymin=data["ymin1"],ymax=data["ymax1"]),
            "Show2": plot(data["f2"],x,xmin=data["xmin2"],xmax=data["xmax2"],ymin=data["ymin2"],ymax=data["ymax2"]),
        }