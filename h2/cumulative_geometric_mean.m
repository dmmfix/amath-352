function m = cumulative_geometric_mean(v, n)
    m = power(prod(v(1:n)), 1/n);
end

