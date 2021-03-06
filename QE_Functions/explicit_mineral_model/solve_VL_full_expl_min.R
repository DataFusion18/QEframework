solve_VL_full_expl_min <- function(CO2) {
    fn <- function(nf) {
        photo_constraint_full(nf, alloc(nf),
                              CO2) - VL_constraint_expl_min(nf, alloc(nf))$NPP
    }
    equilnf <- uniroot(fn,interval=c(0.001,0.1))$root
    equilNPP <- photo_constraint_full(equilnf,
                                      alloc(equilnf), CO2)
    
    ans <- data.frame(equilnf,equilNPP)
    colnames(ans) <- c("nf", "NPP")
    
    return(ans)
}

