function result = dispyaml(data)
% result = dispyaml(data)
% Display mix of cells and structures in YAML format.
% A shortcut to yaml.WriteYaml('',x).

if nargout == 0
  yaml.WriteYaml('',data)
else
  result = yaml.WriteYaml('',data);
end

end