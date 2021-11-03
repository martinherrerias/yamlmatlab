function r = makematrices(r,recursive)
% r = MAKEMATRICES(r) - Recursively walks through a Matlab hierarchy concatenating cell vectors
%   of compatible(§) elements along the first singleton dimension of their elements.
%
% Specifically substitutes cell objects like
%    
%   {{1,2,3},{4,5,6}} -> [1,2,3;4,5,6]'
%   {{{1,2},{3,4}},{{5,6},{7,8}}} -> cat(3,[1,2;3,4]',[5,6;7,8]')
%
% (§) structures with equal fields are also merged into N-d arrays.

    import yaml.*;

    % if ~makeords, return; end
    if isempty(r), r = []; end
    if iscell(r) && isscalar(r), r = makematrices(r{1},recursive); return; end
    if isstruct(r)
        for j = 1:numel(r)
            for f = fieldnames(r)'
                r(j).(f{1}) = makematrices(r(j).(f{1}),recursive);
            end
        end
        return;
    end
    if ~iscell(r), return; end
    
    ok = isvector(r) && ~iscell(r{1});
    
    % Check equal class
    ok = ok && all(cellfun(@(x) isequal(class(x),class(r{1})),r(2:end)));
    
    % Check equal size
    ok = ok && all(cellfun(@(x) isequal(size(x),size(r{1})),r(2:end)));
    
    if ok && isstruct(r{1})
    % Check equal fields
        ok = all(cellfun(@(x) isempty(setxor(fieldnames(x),fieldnames(r{1}))),r(2:end)));
    end
    
    if ok
        if isscalar(r{1})
            r = cat(1,r{:});
        else
            r = cat(ndims(r{1}),r{:});
        end
        r = makematrices(r,recursive);
    else
        r = cellfun(@(x) makematrices(x,recursive),r,'unif',0);
        if recursive, r = makematrices(r,false); end
    end
end