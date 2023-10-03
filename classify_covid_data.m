load("COVIDbyCounty.mat");
load("README.md");
run("cluster_covid_data.m");

%%%%%%%TESTING%%%%%%%%%%%%%%%%
% Combine all divisions into one matrix for clustering
%Figure out which row from the cluster (idx1) that the county is originally
%from (counties)
%Training set (p = randperm(n) //returns a row vector containing 1 to n w/o
%repeating elements
rng(0);

% Associate testing set with training set clusters
distances = pdist2(testingSet, C); % Calculate distances between testing set points and centroids
[~, assignedCluster] = min(distances, [], 2); % Find the closest cluster for each testing set point

%Gets the counties that correspond to the clusters
cluster1 = assignedCluster==1;
cluster1Counties = countiesTest(cluster1);
cluster2 = assignedCluster==2;
cluster2Counties = countiesTest(cluster2);
cluster3 = assignedCluster==3;
cluster3Counties = countiesTest(cluster3);
cluster4 = assignedCluster==4;
cluster4Counties = countiesTest(cluster4);
cluster5 = assignedCluster==5;
cluster5Counties = countiesTest(cluster5);
cluster6 = assignedCluster==6;
cluster6Counties = countiesTest(cluster6);
cluster7 = assignedCluster==7;
cluster7Counties = countiesTest(cluster7);
cluster8 = assignedCluster==8;
cluster8Counties = countiesTest(cluster8);
cluster9 = assignedCluster==9;
cluster9Counties = countiesTest(cluster9);
%Gets the actual counties from each cluster
divisionIdentifier1 = CNTY_CENSUS(cluster1Counties, :);
divisionIdentifier2 = CNTY_CENSUS(cluster2Counties, :);
divisionIdentifier3 = CNTY_CENSUS(cluster3Counties, :);
divisionIdentifier4 = CNTY_CENSUS(cluster4Counties, :);
divisionIdentifier5 = CNTY_CENSUS(cluster5Counties, :);
divisionIdentifier6 = CNTY_CENSUS(cluster6Counties, :);
divisionIdentifier7 = CNTY_CENSUS(cluster7Counties, :);
divisionIdentifier8 = CNTY_CENSUS(cluster8Counties, :);
divisionIdentifier9 = CNTY_CENSUS(cluster9Counties, :);
%Identifies the most frequent division in each cluster
divisionCluster1 = divisionIdentifier1(:, 3);
divisionCluster2 = divisionIdentifier2(:, 3);
divisionCluster3 = divisionIdentifier3(:, 3);
divisionCluster4 = divisionIdentifier4(:, 3);
divisionCluster5 = divisionIdentifier5(:, 3);
divisionCluster6 = divisionIdentifier6(:, 3);
divisionCluster7 = divisionIdentifier7(:, 3);
divisionCluster8 = divisionIdentifier8(:, 3);
divisionCluster9 = divisionIdentifier9(:, 3);
divisionCluster(1, :) = mode(divisionCluster1);
divisionCluster(2, :) = mode(divisionCluster2);
divisionCluster(3, :) = mode(divisionCluster3);
divisionCluster(4, :) = mode(divisionCluster4);
divisionCluster(5, :) = mode(divisionCluster5);
divisionCluster(6, :) = mode(divisionCluster6);
divisionCluster(7, :) = mode(divisionCluster7);
divisionCluster(8, :) = mode(divisionCluster8);
divisionCluster(9, :) = mode(divisionCluster9);
% 9 different matrices represent 9 different clusters.
% For each cluster, the each row represents the each county number from
% cluster_Counties and the column represents the COVID cases
% of each county during 156 weeks
Cluster1CountiesCases = CNTY_COVID(cluster1Counties,:);
Cluster2CountiesCases = CNTY_COVID(cluster2Counties,:);
Cluster3CountiesCases = CNTY_COVID(cluster3Counties,:);
Cluster4CountiesCases = CNTY_COVID(cluster4Counties,:);
Cluster5CountiesCases = CNTY_COVID(cluster5Counties,:);
Cluster6CountiesCases = CNTY_COVID(cluster6Counties,:);
Cluster7CountiesCases = CNTY_COVID(cluster7Counties,:);
Cluster8CountiesCases = CNTY_COVID(cluster8Counties,:);
Cluster9CountiesCases = CNTY_COVID(cluster9Counties,:);
% Centroids of each cluster
centroid1 = mean(Cluster1CountiesCases);
% Made centroid 2 not have mean because Cluster2CountiesCases only
% has 1 county. Same thing for centroid 3.
centroid2 = mean(Cluster2CountiesCases);
centroid3 = mean(Cluster3CountiesCases);
centroid4 = mean(Cluster4CountiesCases);
centroid5 = mean(Cluster5CountiesCases);
centroid6 = mean(Cluster6CountiesCases);
centroid7 = mean(Cluster7CountiesCases);
centroid8 = mean(Cluster8CountiesCases);
centroid9 = mean(Cluster9CountiesCases);
% Used vertcat to vertically concatenate the 9 row centroids
centroids = vertcat(centroid1, centroid2, centroid3, centroid4, ...
centroid5, centroid6, centroid7, centroid8, centroid9);

Div4_cluster1 = divisionCluster(1,1);
disp('Cluster 1 mostly consists of West North Central Region')
Div3_cluster2 = divisionCluster(2,1);
disp('Cluster 2 mostly consists of East North Central Region')
DivNaN_cluster3 = divisionCluster(3,1);
disp('Cluster 3 is supposed to show West South Central Region') 
% Since there are only 20 random data points used, cluster 3 does not show
% a region in this case. However, if more data points were used, there 
% would most likely be West South Central Region representing cluster 3. 
Div2_cluster4 = divisionCluster(4,1);
disp('Cluster 4 mostly consists of Middle Atlantic Region')
Div1_cluster5 = divisionCluster(5,1);
disp('Cluster 5 mostly consists of New England Region')
Div5_cluster6 = divisionCluster(6,1);
disp('Cluster 6 mostly consists of South Atlantic Region')
Div9_cluster7 = divisionCluster(7,1);
disp('Cluster 7 mostly consists of Pacific Region')
Div6_cluster8 = divisionCluster(8,1);
disp('Cluster 8 mostly consists of East South Central Region')
DivNaN_cluster9 = divisionCluster(9,1);
disp('Cluster 9 is supposed to show Mountain Region') 
% Since there are only 20 random data points used, cluster 9 does not show
% a region in this case. However, if more data points were used, there 
% would most likely be Mountain Region representing cluster 9. 

% Assuming you have defined your test county's data in testCountyData
% and the true division label in trueLabel
testCounty = vertcat(Cluster1CountiesCases, Cluster2CountiesCases, ...
Cluster3CountiesCases, Cluster4CountiesCases, Cluster5CountiesCases, ...
Cluster6CountiesCases, Cluster7CountiesCases, Cluster8CountiesCases, ...
Cluster9CountiesCases);
% Calculate distances between test county and all centroids
distance = pdist2(testCounty, centroids);
% Find the cluster (centroid) with the minimum distance
[~, assignedCluster] = min(distance);
index1 = assignedCluster(1, 1); 
index2 = assignedCluster(1, 2);
index3 = assignedCluster(1, 3);
index4 = assignedCluster(1, 4);
index5 = assignedCluster(1, 5);
index6 = assignedCluster(1, 6);
index7 = assignedCluster(1, 7);
index8 = assignedCluster(1, 8);
index9 = assignedCluster(1, 9);

row2 = testCounty(index1, :);
row7 = testCounty(index2, :);
row1 = testCounty(index3, :);
row17 = testCounty(index4, :);
row21 = testCounty(index5, :);
row35 = testCounty(index6, :);
row41 = testCounty(index7, :);
row44 = testCounty(index8, :);
row1 = testCounty(index9, :);
% vertcat the rows
testCountyNeighbors = vertcat(row2, row7, row1, row17, row21, row35, ...
row41, row44, row1);
% create a column matrix of the divisions of the counties #
matchingRow1 = [];
matchingRow2 = [];
matchingRow3 = [];
matchingRow4 = [];
matchingRow5 = [];
matchingRow6 = [];
matchingRow7 = [];
matchingRow8 = [];
matchingRow9 = [];

% Store row CNTY_COVID into a variable
if isequal(testCountyNeighbors(1, :), CNTY_COVID(81, :))
    matchingRow1 = CNTY_COVID(2, :);
end
if isequal(testCountyNeighbors(2, :), CNTY_COVID(166, :))
    matchingRow2 = CNTY_COVID(7, :);
end
if isequal(testCountyNeighbors(3, :), CNTY_COVID(82, :))
    matchingRow3 = CNTY_COVID(1, :);
end
if isequal(testCountyNeighbors(4, :), CNTY_COVID(146, :))
    matchingRow4 = CNTY_COVID(17, :);
end
if isequal(testCountyNeighbors(5, :), CNTY_COVID(185, :))
    matchingRow5 = CNTY_COVID(21, :);
end
if isequal(testCountyNeighbors(6, :), CNTY_COVID(59, :))
    matchingRow6 = CNTY_COVID(35, :);
end
if isequal(testCountyNeighbors(7, :), CNTY_COVID(31, :))
    matchingRow7 = CNTY_COVID(41, :);
end
if isequal(testCountyNeighbors(8, :), CNTY_COVID(197, :))
    matchingRow8 = CNTY_COVID(44, :);
end
if isequal(testCountyNeighbors(9, :), CNTY_COVID(82, :))
    matchingRow9 = CNTY_COVID(1, :);
end
% vertcat the rows
testCountyNeighbors1 = vertcat(matchingRow1, matchingRow2, matchingRow3, ...
matchingRow4, matchingRow5, matchingRow6, matchingRow7, matchingRow8, ...
matchingRow9);
% Find the divisions
CNTY81 = CNTY_CENSUS(81,3);
CNTY166 = CNTY_CENSUS(166,3);
CNTY82 = CNTY_CENSUS(82,3);
CNTY146 = CNTY_CENSUS(146,3);
CNTY185 = CNTY_CENSUS(185,3);
CNTY59 = CNTY_CENSUS(59,3);
CNTY31 = CNTY_CENSUS(31,3);
CNTY197 = CNTY_CENSUS(197,3);
CNTY82 = CNTY_CENSUS(82,3);
% The true division level for each test county is the most frequent
% divisions clustered in each test county.
% This is used to assess the accuracy of the clusters.
TrueDivTestCNTY1 = divisionCluster(1,1);
TrueDivTestCNTY2 = divisionCluster(2,1);
TrueDivTestCNTY3 = divisionCluster(3,1);
TrueDivTestCNTY4 = divisionCluster(4,1);
TrueDivTestCNTY5 = divisionCluster(5,1);
TrueDivTestCNTY6 = divisionCluster(6,1);
TrueDivTestCNTY7 = divisionCluster(7,1);
TrueDivTestCNTY8 = divisionCluster(8,1);
TrueDivTestCNTY9 = divisionCluster(9,1);
% Print the values of the variables
disp(['Value of CNTY81: ', num2str(CNTY81{1,1})]);
disp(['Value of TrueDivTestCNTY1: ', num2str(TrueDivTestCNTY1{1,1})]);
disp(['Value of CNTY166: ', num2str(CNTY166{1,1})]);
disp(['Value of TrueDivTestCNTY2: ', num2str(TrueDivTestCNTY2{1,1})]);
disp(['Value of CNTY82: ', num2str(CNTY82{1,1})]);
disp(['Value of TrueDivTestCNTY3: ', num2str(TrueDivTestCNTY3{1,1})]);
disp(['Value of CNTY146: ', num2str(CNTY146{1,1})]);
disp(['Value of TrueDivTestCNTY4: ', num2str(TrueDivTestCNTY4{1,1})]);
disp(['Value of CNTY185: ', num2str(CNTY185{1,1})]);
disp(['Value of TrueDivTestCNTY5: ', num2str(TrueDivTestCNTY5{1,1})]);
disp(['Value of CNTY59: ', num2str(CNTY59{1,1})]);
disp(['Value of TrueDivTestCNTY6: ', num2str(TrueDivTestCNTY6{1,1})]);
disp(['Value of CNTY31: ', num2str(CNTY31{1,1})]);
disp(['Value of TrueDivTestCNTY7: ', num2str(TrueDivTestCNTY7{1,1})]);
disp(['Value of CNTY197: ', num2str(CNTY197{1,1})]);
disp(['Value of TrueDivTestCNTY8: ', num2str(TrueDivTestCNTY8{1,1})]);
disp(['Value of CNTY82: ', num2str(CNTY82{1,1})]);
disp(['Value of TrueDivTestCNTY9: ', num2str(TrueDivTestCNTY9{1,1})]);
% Compare the assigned label with the true division label of the test county
if CNTY81{1,1} == TrueDivTestCNTY1{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY166{1,1} == TrueDivTestCNTY2{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY82{1,1} == TrueDivTestCNTY3{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY146{1,1} == TrueDivTestCNTY4{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY185{1,1} == TrueDivTestCNTY5{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY59{1,1} == TrueDivTestCNTY6{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY31{1,1} == TrueDivTestCNTY7{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY197{1,1} == TrueDivTestCNTY8{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY82{1,1} == TrueDivTestCNTY9{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
