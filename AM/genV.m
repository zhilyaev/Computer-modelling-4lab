function E = genV(m, sigma, dmN, elN)
E = m + sigma * randn(elN, dmN);
end