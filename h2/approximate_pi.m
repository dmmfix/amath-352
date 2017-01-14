function ap = approximate_pi(n)
    rhs = sum(arrayfun(@(k) 1 / (power(2*k - 1,2) * power(2*k + 1, 2)), 1:n));
    ap = sqrt(rhs * 16 + 8);
end

