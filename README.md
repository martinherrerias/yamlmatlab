## yamlmatlab

This is a github copy of https://code.google.com/p/yamlmatlab/
that has been packaged into +yaml namespace by Yauhen Yakimovich.

Includes minor fixes and updates from Jesus Briales, Rob Campbell, Ion Iturbide, and myself.

## Installation

Just add the code and all subfolders to the MATLAB path: 

```matlab
addpath(genpath('path/to/code'));
```

## Usage

Reading in:

```matlab
yaml_file = 'test.yaml';
YamlStruct = yaml.ReadYaml(yaml_file);
```

Writing out

 ```matlab
 x.name='Martin';
 yaml.WriteYaml('test.yaml',x)
```

## Main authors

* Jiri Cigler, Dept. of Control Engineering, CTU Prague http://support.dce.felk.cvut.cz/pub/ciglejir/
* Jan Siroky, Energocentrum PLUS, s.r.o.
* Pavel Tomasko, student at Faculty of Electrical Engineering, CTU Prague and Institute of Chemical Technology, Prague.
