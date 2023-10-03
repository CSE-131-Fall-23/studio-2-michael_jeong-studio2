load("COVIDbyCounty.mat");
load("README.md");
A = transpose(CNTY_COVID); % Made county (columns) and date (rows).
COVIDweeks = (1:156)'; % Made column with week 1 to week 156.
A = [A, COVIDweeks]; % Made new data table with weeks at the last column.
% Found all the counties (columns) and grouped them into each division.
COVID_Div1a = A(:, 43:49);
COVID_Div1b = A(:, 95:99);
COVID_Div1c = A(:, 105:111);
COVID_Div1d = A(:, 140:142);
COVID_Div1e = A(:, 189:190);
COVID_Div1f = A(:, 218);

COVID_Div2a = A(:, 143:151);
COVID_Div2b = A(:, 156:161);
COVID_Div2c = A(:, 179:188);

COVID_Div3a = A(:, 68:77);
COVID_Div3b = A(:, 112:117);
COVID_Div3c = A(:, 166:172);
COVID_Div3d = A(:, 224:225);

COVID_Div4a = A(:, 78:85);
COVID_Div4b = A(:, 118:124);
COVID_Div4c = A(:, 130:135);
COVID_Div4d = A(:, 137:138);
COVID_Div4e = A(:, 165);
COVID_Div4f = A(:, 192);

COVID_Div5a = A(:, 50:63);
COVID_Div5b = A(:, 100:104);
COVID_Div5c = A(:, 162:164);
COVID_Div5d = A(:, 191);
COVID_Div5e = A(:, 219:220);

COVID_Div6a = A(:, 1:9);
COVID_Div6b = A(:, 86:90);
COVID_Div6c = A(:, 125:129);
COVID_Div6d = A(:, 193:198);

COVID_Div7a = A(:, 91:94);
COVID_Div7b = A(:, 15:17);
COVID_Div7c = A(:, 173:174);
COVID_Div7d = A(:, 199:214);

COVID_Div8a = A(:, 10:14);
COVID_Div8b = A(:, 35:42);
COVID_Div8c = A(:, 65:67);
COVID_Div8d = A(:, 136);
COVID_Div8e = A(:, 136);
COVID_Div8f = A(:, 139);
COVID_Div8g = A(:, 152:155);
COVID_Div8h = A(:, 215:217);

COVID_Div9a = A(:, 18:34);
COVID_Div9b = A(:, 64);
COVID_Div9c = A(:, 175:178);
COVID_Div9d = A(:, 221:223);
% Concatenating all the columns of counties into each division
COVID_Div1 = [COVID_Div1a, COVID_Div1b, COVID_Div1c, COVID_Div1d,...
COVID_Div1e, COVID_Div1f];
COVID_Div2 = [COVID_Div2a, COVID_Div2b, COVID_Div2c];
COVID_Div3 = [COVID_Div3a, COVID_Div3b, COVID_Div3c, COVID_Div3d];
COVID_Div4 = [COVID_Div4a, COVID_Div4b, COVID_Div4c, COVID_Div4d,...
COVID_Div4e, COVID_Div4f];
COVID_Div5 = [COVID_Div5a, COVID_Div5b, COVID_Div5c, COVID_Div5d,...
COVID_Div5e];
COVID_Div6 = [COVID_Div6a, COVID_Div6b, COVID_Div6c, COVID_Div6d];
COVID_Div7 = [COVID_Div7a, COVID_Div7b, COVID_Div7c, COVID_Div7d];
COVID_Div8 = [COVID_Div8a, COVID_Div8b, COVID_Div8c, COVID_Div8d,...
COVID_Div8e, COVID_Div8f, COVID_Div8g, COVID_Div8h];
COVID_Div9 = [COVID_Div9a, COVID_Div9b, COVID_Div9c, COVID_Div9d];
Div1_SumPerWeek = sum(COVID_Div1, 2);
Div2_SumPerWeek = sum(COVID_Div2, 2);
Div3_SumPerWeek = sum(COVID_Div3, 2);
Div4_SumPerWeek = sum(COVID_Div4, 2);
Div5_SumPerWeek = sum(COVID_Div5, 2);
Div6_SumPerWeek = sum(COVID_Div6, 2);
Div7_SumPerWeek = sum(COVID_Div7, 2);
Div8_SumPerWeek = sum(COVID_Div8, 2);
Div9_SumPerWeek = sum(COVID_Div9, 2);
% Xdate = 156 weeks that is located in 226th column in data A.
% YDiv_ = All the sums of cases of each division for each week.
figure;
Xdate = A(:, 226);
YDiv1 = Div1_SumPerWeek;
plot(Xdate, Div1_SumPerWeek,"red")
hold on
Xdate = A(:, 226);
YDiv2 = Div2_SumPerWeek;
plot(Xdate, Div2_SumPerWeek,"blue")
hold on
Xdate = A(:, 226);
YDiv3 = Div3_SumPerWeek;
plot(Xdate, Div3_SumPerWeek,"green")
hold on
Xdate = A(:, 226);
YDiv4 = Div4_SumPerWeek;
plot(Xdate, Div4_SumPerWeek,"yellow")
hold on
Xdate = A(:, 226);
YDiv5 = Div5_SumPerWeek;
plot(Xdate, Div5_SumPerWeek,"cyan")
hold on
Xdate = A(:, 226);
YDiv6 = Div6_SumPerWeek;
plot(Xdate, Div6_SumPerWeek,"magenta")
hold on
Xdate = A(:, 226);
YDiv7 = Div7_SumPerWeek;
plot(Xdate, Div7_SumPerWeek,"black")
hold on
Xdate = A(:, 226);
YDiv8 = Div8_SumPerWeek;
plot(Xdate, Div8_SumPerWeek,"color", "#FFA500")
hold on
Xdate = A(:, 226);
YDiv9 = Div9_SumPerWeek;
plot(Xdate, Div9_SumPerWeek,"color", "#800080")
title("COVID Cases of Nine Divisions Over n Weeks");
xlabel("Weeks");
ylabel("COVID Cases");
legend("Div1", 'Div2', 'Div3', 'Div4', 'Div5', 'Div6', 'Div7', 'Div8', ...
    'Div9');






%%%%%%%TRAINING%%%%%%%%%%%%%%%%
% Combine all divisions into one matrix for clustering
%Figure out which row from the cluster (idx1) that the county is originally
%from (counties)
allDivisions = [COVID_Div1, COVID_Div2, COVID_Div3, COVID_Div4, COVID_Div5, ...
COVID_Div6, COVID_Div7, COVID_Div8, COVID_Div9];
%Training set (p = randperm(n) //returns a row vector containing 1 to n w/o
%repeating elements

rng(0);

counties = randperm(225, 180)';
trainingSet = CNTY_COVID(counties, :); %training group

countiesTest = randperm(225, 45)';
testingSet = CNTY_COVID(countiesTest, :); %testing group

numClusters = 9;
[idx1, C] = kmeans(trainingSet, numClusters,'Replicates',1000); 








%Gets the counties that correspond to the clusters
cluster1 = idx1==1;
cluster1Counties = counties(cluster1);
cluster2 = idx1==2;
cluster2Counties = counties(cluster2);
cluster3 = idx1==3;
cluster3Counties = counties(cluster3);
cluster4 = idx1==4;
cluster4Counties = counties(cluster4);
cluster5 = idx1==5;
cluster5Counties = counties(cluster5);
cluster6 = idx1==6;
cluster6Counties = counties(cluster6);
cluster7 = idx1==7;
cluster7Counties = counties(cluster7);
cluster8 = idx1==8;
cluster8Counties = counties(cluster8);
cluster9 = idx1==9;
cluster9Counties = counties(cluster9);
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
% These two blocks of code below give the same results
% block code 1
% k = 1;
% [idx, centroids] = kmeans(Cluster1CountiesCases,k);
% desiredCluster = 1;
% clusterPoints = Cluster1CountiesCases(idx==desiredCluster,:);
% centroid = mean(clusterPoints);
% block code 2
% centroids = mean(Cluster1CountiesCases);

centroid1 = mean(Cluster1CountiesCases);
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

Div4_cluster1 = divisionCluster(1,1)
disp('Cluster 1 mostly consists of West North Central Region')
Div7_cluster2 = divisionCluster(2,1)
disp('Cluster 2 mostly consists of West South Central Region')
Div1_cluster3 = divisionCluster(3,1)
disp('Cluster 3 mostly consists of New England Region')
Div2_cluster4 = divisionCluster(4,1)
disp('Cluster 4 mostly consists of Mid Atlantic Region')
Div1_cluster5 = divisionCluster(5,1)
disp('Cluster 5 mostly consists of New England Region')
Div6_cluster6 = divisionCluster(6,1)
disp('Cluster 6 mostly consists of East South Central Region')
Div9_cluster7 = divisionCluster(7,1)
disp('Cluster 7 mostly consists of Pacific Region')
Div9_cluster8 = divisionCluster(8,1)
disp('Cluster 8 mostly consists of Mountain Region')
Div8_cluster9 = divisionCluster(9,1)
disp('Cluster 9 mostly consists of Mountain Region')
testCounty = vertcat(Cluster1CountiesCases, Cluster2CountiesCases, ...
Cluster3CountiesCases, Cluster4CountiesCases, Cluster5CountiesCases, ...
Cluster6CountiesCases, Cluster7CountiesCases, Cluster8CountiesCases, ...
Cluster9CountiesCases);
% Calculate distances between test county and all centroids
distance = pdist2(testCounty, centroids);
% Find the cluster (centroid) with the minimum distance
% The entries in assignedCluster represents the county number that is
% closest to the values of the centroids by row.
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
row22 = testCounty(index1, :);
row41 = testCounty(index2, :);
row52 = testCounty(index3, :);
row64 = testCounty(index4, :);
row81 = testCounty(index5, :);
row125 = testCounty(index6, :);
row140 = testCounty(index7, :);
row159 = testCounty(index8, :);
row176 = testCounty(index9, :);
% vertcat the rows
testCountyNeighbors = vertcat(row22, row41, row52, row64, row81, row125, ...
row140, row159, row176);
% create a column matrix of the divisions of the counties #
% Store row of CNTY_COVID into a variable
if isequal(testCountyNeighbors(1, :), CNTY_COVID(119, :))
matchingRow1 = CNTY_COVID(119, :);
end
if isequal(testCountyNeighbors(2, :), CNTY_COVID(84, :))
matchingRow2 = CNTY_COVID(84, :);
end
if isequal(testCountyNeighbors(3, :), CNTY_COVID(97, :))
matchingRow3 = CNTY_COVID(97, :);
end
if isequal(testCountyNeighbors(4, :), CNTY_COVID(146, :))
matchingRow4 = CNTY_COVID(146, :);
end
if isequal(testCountyNeighbors(5, :), CNTY_COVID(183, :))
matchingRow5 = CNTY_COVID(183, :);
end
if isequal(testCountyNeighbors(6, :), CNTY_COVID(59, :))
matchingRow6 = CNTY_COVID(59, :);
end
if isequal(testCountyNeighbors(7, :), CNTY_COVID(19, :))
matchingRow7 = CNTY_COVID(19, :);
end
if isequal(testCountyNeighbors(8, :), CNTY_COVID(32, :))
matchingRow8 = CNTY_COVID(32, :);
end
if isequal(testCountyNeighbors(9, :), CNTY_COVID(66, :))
matchingRow9 = CNTY_COVID(66, :);
end
% vertcat the rows
testCountyNeighbors1 = vertcat(matchingRow1, matchingRow2, matchingRow3, ...
matchingRow4, matchingRow5, matchingRow6, matchingRow7, matchingRow8, ...
matchingRow9);
% Find the divisions
CNTY119 = CNTY_CENSUS(119,3);
CNTY84 = CNTY_CENSUS(84,3);
CNTY97 = CNTY_CENSUS(97,3);
CNTY146 = CNTY_CENSUS(146,3);
CNTY183 = CNTY_CENSUS(183,3);
CNTY59 = CNTY_CENSUS(59,3);
CNTY19 = CNTY_CENSUS(19,3);
CNTY32 = CNTY_CENSUS(32,3);
CNTY66 = CNTY_CENSUS(66,3);
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
disp(['Value of CNTY119: ', num2str(CNTY119{1,1})]);
disp(['Value of TrueDivTestCNTY1: ', num2str(TrueDivTestCNTY1{1,1})]);
disp(['Value of CNTY84: ', num2str(CNTY84{1,1})]);
disp(['Value of TrueDivTestCNTY2: ', num2str(TrueDivTestCNTY2{1,1})]);
disp(['Value of CNTY97: ', num2str(CNTY97{1,1})]);
disp(['Value of TrueDivTestCNTY3: ', num2str(TrueDivTestCNTY3{1,1})]);
disp(['Value of CNTY146: ', num2str(CNTY146{1,1})]);
disp(['Value of TrueDivTestCNTY4: ', num2str(TrueDivTestCNTY4{1,1})]);
disp(['Value of CNTY183: ', num2str(CNTY183{1,1})]);
disp(['Value of TrueDivTestCNTY5: ', num2str(TrueDivTestCNTY5{1,1})]);
disp(['Value of CNTY59: ', num2str(CNTY59{1,1})]);
disp(['Value of TrueDivTestCNTY6: ', num2str(TrueDivTestCNTY6{1,1})]);
disp(['Value of CNTY19: ', num2str(CNTY19{1,1})]);
disp(['Value of TrueDivTestCNTY7: ', num2str(TrueDivTestCNTY7{1,1})]);
disp(['Value of CNTY32: ', num2str(CNTY32{1,1})]);
disp(['Value of TrueDivTestCNTY8: ', num2str(TrueDivTestCNTY8{1,1})]);
disp(['Value of CNTY66: ', num2str(CNTY66{1,1})]);
disp(['Value of TrueDivTestCNTY9: ', num2str(TrueDivTestCNTY9{1,1})]);
% Compare the assigned label with the true division label of the test county
if CNTY119{1,1} == TrueDivTestCNTY1{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY84{1,1} == TrueDivTestCNTY2{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY97{1,1} == TrueDivTestCNTY3{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY146{1,1} == TrueDivTestCNTY4{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY183{1,1} == TrueDivTestCNTY5{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY59{1,1} == TrueDivTestCNTY6{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY19{1,1} == TrueDivTestCNTY7{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY32{1,1} == TrueDivTestCNTY8{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end
if CNTY66{1,1} == TrueDivTestCNTY9{1,1}
disp('Centroid matches the division label of the test county');
else
disp('Centroid does not match the division label of the test county');
end



