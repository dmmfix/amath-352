function [L, A, opcount] = ge_nmm(A)
% Gaussian Elimination code
    N = length(A);
    
    L = eye(N);
    opcount = 0;

    % for each pivot along the diagonal
    for ii = 1:N-1
        % for each row under the pivot
        for jj=ii+1:N
            % factor is ratio between pivot value
            % and entry below pivot in row jj
            fac = A(jj,ii) / A(ii,ii);
            opcount = opcount + 1;

            % Build up L
            L(jj,ii) = fac;
            
            % row replacement operation
            A(jj,ii:end) = A(jj,ii:end) - fac * A(ii,ii:end);
            opcount = opcount + 2 * (N-ii+1);
        end
    end
end
