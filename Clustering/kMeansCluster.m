function [y,x]=kMeansCluster(m,k)
%%%%%%%%%%%%%%%%
%                                                        
% kMeansCluster - Simple k means clustering algorithm                                                              
% Author: Kardi Teknomo, Ph.D.                                                                  
%                                                                                                                    
% Purpose: classify the objects in data matrix based on the attributes    
% Criteria: minimize Euclidean distance between centroids and object points                    
% For more explanation of the algorithm, see http://people.revoledu.com/kardi/tutorial/kMean/index.html    
% Output: matrix data plus an additional column represent the group of each object               
%                                                                                                                
% Example: m = [ 1 1; 2 1; 4 3; 5 4]  or in a nice form                         
%          m = [ 1 1;                                                                                     
%                2 1;                                                                                         
%                4 3;                                                                                         
%                5 4]                                                                                         
%          k = 2                                                                                             
% kMeansCluster(m,k) produces m = [ 1 1 1;                                        
%                                   2 1 1;                                                                   
%                                   4 3 2;                                                                   
%                                   5 4 2]                                                                   
% Input:
%   m      - required, matrix data: objects in rows and attributes in columns                                                 
%   k      - optional, number of groups (default = 1)
%   isRand - optional, if using random initialization isRand=1, otherwise input any number (default)
%            it will assign the first k data as initial centroids
%
% Local Variables
%   f      - row number of data that belong to group i
%   c      - centroid coordinate size (1:k, 1:maxCol)
%   g      - current iteration group matrix size (1:maxRow)
%   i      - scalar iterator 
%   maxCol - scalar number of rows in the data matrix m = number of attributes
%   maxRow - scalar number of columns in the data matrix m = number of objects
%   temp   - previous iteration group matrix size (1:maxRow)
%   z      - minimum value (not needed)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin<2,        k=1;        end
    
[maxRow, maxCol]=size(m);
if maxRow<=k 
    y=[m, 1:maxRow];
else
	
	% initial value of centroid
    c = [];
    c = cat(1,c,m(1,:));
    t=1;
    for i=2:maxRow
        mx=0;
        for j=1:t
            mtch = 0;
            for w=1:8
                if isequal(m(i,w),c(j,w))
                    mtch = mtch + 1;
                end
            end
            if mtch > mx
                mx = mtch;
            end
        end
        if mx < 6
            c = cat(1,c,m(i,:));
            t = t+1;
        end
        if isequal(t,k)
            break;
        end
    end
    c;
    avgDist = 0.0;
	temp=zeros(maxRow,1);   % initialize as zero vector
	while 1,
        c;
        d=DistMatrix(m,c);  % calculate objcets-centroid distances
        [z,g]=min(d,[],2);  % find group matrix g
        avgDist = sum(z)/maxRow;
        if g==temp
            break;          % stop the iteration
        else
            temp=g;         % copy group matrix to temporary variable
        end
        for i=1:k
            f=find(g==i);
            if f            % only compute centroid if f is not empty
               cnt = zeros(size(f));
               for j=1:size(f)
                   cnt2 = 0;
                   for w=1:size(f)
                       if isequal(m(f(j),:),m(f(w),:))
                           cnt2 = cnt2 + 1;
                       end
                   end
                   cnt(j) = cnt2;
               end
               mx = -1;
               for j=1:size(f)
                   if cnt(j) > mx
                       mx = cnt(j);
                       c(i,:) = m(f(j),:);
                   end
               end
            end
        end
    end
    gt = num2cell(g);
    y = [m,gt]
    x = avgDist;
end