function mk_lerper(s,e,r,t)
    return {
        s=s,
        e=e,
        r=r,
        t=t or 0,
        update=function(self)
            self.t+=self.r
            if(self.t>1) self.t=1
            if(self.t<0) self.t=0
        end,
        val=function(self)
            return(((1-self.t)*self.s)
                +(self.e*self.t)
            )
        end
    }
end