% Abstract class for the Bio-Formats Matlab unit tests
%
% Require MATLAB xUnit Test Framework to be installed
% http://www.mathworks.com/matlabcentral/fileexchange/22846-matlab-xunit-test-framework

% OME Bio-Formats package for reading and converting biological file formats.
%
% Copyright (C) 2013 Open Microscopy Environment:
%   - Board of Regents of the University of Wisconsin-Madison
%   - Glencoe Software, Inc.
%   - University of Dundee
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as
% published by the Free Software Foundation, either version 2 of the
% License, or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License along
% with this program; if not, write to the Free Software Foundation, Inc.,
% 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

classdef TestBfMatlab < TestCase
    
    properties
        lociToolsPath
    end
    
    methods
        function self = TestBfMatlab(name)
            self = self@TestCase(name);
        end
        
        function setUp(self)
            % Get path to loci_tools (assuming it is in Matlab path)
            self.lociToolsPath = which('loci_tools.jar');
            assert(~isempty(self.lociToolsPath));
            
            % Remove loci_tools from dynamic class path
            if ismember(self.lociToolsPath,javaclasspath('-dynamic'))
                javarmpath(self.lociToolsPath);
            end
        end
        
        function tearDown(self)
            % Remove loci_tools from dynamic class path
            if ismember(self.lociToolsPath,javaclasspath('-dynamic'))
                javarmpath(self.lociToolsPath);
            end
        end
    end
end
