function nla = setup_simple_nla(gen_list, gen_max)
%SETUP_SIMPLE_NLA Create 2D NLA structure for multirate MHR.
%   NLA = SETUP_SIMPLE_NLA(GEN_LIST, GEN_MAX) returns a nonuniform linear
%   array (NLA) structure, which is a structure with two fields:
%       
%       nla.sensors:    contains two cells, one for both the x- and 
%                       y-direction, which contain the sensor positions
%                       along that direction. The first sensor must always
%                       be located at (0, 0). If x is an element of 
%                       nla.sensors{1}, and y is an element of
%                       nla.sensors{2}, there is a sensor located at 
%                       (x, y).
%       nla.subulas:    contains two cells, one for both the x- and 
%                       y-direction, which contain the sub-ULAs in that
%                       direction. Sub-ULAs are uniform linear arrays,
%                       i.e., sensors that are regularly spaced.
%
%   The argument gen_list should be a cell array such that gen_list{1} is a
%   list of generators for the subULAs in the x-direction. The array
%   gen_list{2} contains the generators for the subULAs in the y-direction.
%   The cell array gen_max is such that the i-th element of gen_max{j} 
%   specifies the position of the last sensor in the subULA that 
%   corresponds to the i-th generator in gen_list{j}.
%
%   Example:
%    
%       A 2D nonuniform linear sensor array consists of sensors on a grid,
%       in which the spacing between the sensors in the array is irregular.
%       If the sensor array, in which X represents a sensor and O 
%       represents a missing sensor, is
%
%           X - O - X - X - X - O - X
%           X - O - X - X - X - O - X
%           X - O - X - X - X - O - X
%           X - O - X - X - X - O - X
%           O - O - O - O - O - O - O
%           O - O - O - O - O - O - O
%           X - O - X - X - X - O - X
%
%       then we describe this NLA using the first field of the struct nla,
%       which contains the positions of the sensors, as follows:
%
%           nla.sensors{1} = [0, 2, 3, 4, 6]; % the x-direction
%           nla.sensors{2} = [0, 1, 2, 3, 6]; % the y-direction
%
%       The next field contains subsets of these sensors that are regularly
%       spaced (sub-ULAs), ordered based on this spacing:
%
%           % The x-direction 
%           nla.subulas{1} = {[0, 2, 4]; ...    % Spacing = 2
%                             [0, 3, 6]}        % Spacing = 3
%           % The y-direction 
%           nla.subulas{2} = {[0, 1, 2, 3]; ... % Spacing = 1
%                             [0, 3, 6]}        % Spacing = 3
% 
%       This NLA can be created using
%
%           gen_list = {[2, 3], [1, 3]};
%           gen_max  = {[4, 6], [3, 6]};
%
%       This creates two subULAs in the x-direction, one with generator 2 
%       and max element 4 ([0, 2, 4]) and one with generator 3 and max
%       element 6 ([0, 3, 6]). It creates two subULAs in the y-direction, 
%       one with generator 1 and max element 3 ([0, 1, 2, 3]) and one with
%       generator 3 and max element 6 ([0, 3, 6]). Note that for any subULA
%       the first element is always 0.

%   Authors:    Robin Kenis             (Robin.Kenis@kuleuven.be)
%               Lieven De Lathauwer     (Lieven.DeLathauwer@kuleuven.be)
%
%   Version History:
%       - 2021/06/07    RK      Updated version.
%       - 2017/01/01    MS      Initial version.

    nla = struct;
    nla.sensors = cell(2, 1);
    nla.subulas = cell(2, 1);
    for i = 1:2
        [nla.subulas{i}, nla.sensors{i}] = setup_nla_1d(gen_list{i}, gen_max{i});
    end
end

function [subulas, sensors] = setup_nla_1d(gen_list, gen_max)
%SETUP_NLA_1D Create 1D NLA structure for one direction of multirate MHR.
%   [SUBULAS, SENSORS] = SETUP_NLA_1D(GEN_LIST, GEN_MAX) returns a 
%   nonuniform linear array (NLA) as a structure, which is a structure with 
%   two fields:
%       
%       nla.sensors:    contains all the positions of sensors in the NLA,
%                       the first sensor will always be positioned at 0. 
%       nla.subulas:    contains the subULAs in the NLA, which are 
%                       uniformly spaced NLAs. For example, if the sensor 
%                       positions are [0, 1, 3, 4, 5, 7, 8, 9], then the 
%                       sensors at positions [1, 3, 5, 7, 9] form a subULA 
%                       with generator 2.
%
%   The argument gen_list should be a list of generators for the subULAs.
%   The argument gen_max is a list such that the i-th element of gen_max
%   specifies the position of the last sensor in the subULA that  
%   corresponds to the i-th generator in gen_list.

    sensors  = [];
    subulas = cell(length(gen_list), 1);
    for i = 1:length(gen_list)
        subulas{i} = 0:gen_list(i):gen_max(i);
        sensors = unique([sensors, subulas{i}]);
    end
end