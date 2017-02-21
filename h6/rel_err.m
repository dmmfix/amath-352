function output = rel_err(b_exact, b_appx)
    output = norm(b_exact - b_appx,2) / norm(b_exact,2);
end
