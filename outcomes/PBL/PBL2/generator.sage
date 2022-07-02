class Generator(BaseGenerator):
    def data(self):
        
        x,y = var('x,y')

        #stuff for first item
        center = (randrange(-15,16),randrange(-15,16));
        radius = randrange(1,13);

        

        #stuff for second item
        c = (randrange(-15,16),randrange(-15,16));
        r = randrange(1,13);
        half = choice(["top","bottom"]);
        sign_dict = {"top": '+', "bottom": '-'};
        dx = x-c[0];
        dy = y-c[1];

        

        return {
            "center": center,
            "radius": radius,
            "DeltaX": x-center[0],
            "DeltaY": y-center[1],
            "radius^2": radius^2,
            
            "c": c,
            "r": r,
            "yc": c[1],
            "rsq": r^2,
            "dx": dx,
            "dy": dy,
            "half": half,
            "pm": sign_dict[half],
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": circle( data["center"] , data["radius"] , color = 'red') + point( data["center"] , color = 'blue' , pointsize = 20),
            "Show2": circle(data["c"] , data["r"] , color = 'red') + point( data["c"] , color = 'blue' , pointsize = 20),
        }