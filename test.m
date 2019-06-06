CName = [{'apple'};{'banana'};{'orange'};{'milk'};{'book'};{'chair'};{'computer'}];
CPrice = [1.0;1.0;1.0;1.0;10.0;12;1000];
CInventory = [1000;1000;1000;1000;500;100;100];
save Commodity CName CPrice CInventory

startdate = datetime(2019,1,1);
enddate = datetime(2019,6,1);
temp = startdate;
Date = [];
while temp < enddate
    Date = [Date,temp];
    temp = temp + 1;
end
Sale = randi([10000,12000],1,length(Date));
save Sales.mat Date Sale