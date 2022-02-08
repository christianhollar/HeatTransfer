ShinyBlack = [56.8,54.6,50.7,46.2,44.3]
MatteBlack = [61.6,59.1,56.0,50.5,51.4]
SilverPolished = [24.5,26.1,24.4,25,24.8]
SilverUnpolished = [25.9,26.1,24.4,24.9,24.9]
White = [61.7,58.6,55.7,50.0,47.7]
Actual = [60,55,50,45,40,0.96]

ShinyBlackE = 0.9*(zeros(size(ShinyBlack))+1);
MatteBlackE = 0.98*(zeros(size(MatteBlack))+1);
SilverPolishedE = 0.02*(zeros(size(SilverPolished))+1);
SilverUnpolishedE = 0.2*(zeros(size(SilverUnpolished))+1);
WhiteE = 0.92*(zeros(size(White))+1);
ActualE = 0.96*(zeros(size(Actual))+1);

bes = 60;
s = 55;
bwt = 50;
gt = 45;
b = 40;
oa = 0.96;

bese = 0.9;
se = 0.82;
bwte = 0.88;
gte = 0.95;
be = 0.2;
oae = 0.8;

scatter(ShinyBlackE,ShinyBlack)
hold on
scatter(MatteBlackE,MatteBlack)
scatter(SilverPolishedE,SilverPolished)
scatter(SilverUnpolishedE,SilverUnpolished)
scatter(WhiteE,White)
scatter(ActualE,Actual)
scatter(bese,bes)
scatter(se,s)
scatter(bwte,bwt)
scatter(gte,gt)
scatter(be,b)
scatter(oae,oa)

legend('Shiny Black','Matte Black','Silver Polished','Silver Non-Polished','White','Actual')%,'Sign','Sky','Table','Granite','Brick','Box','Outside')
