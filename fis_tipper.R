library(shiny)
fis = newfis('tipper');

fis <- addvar(fis, 'input', 'service', c(0,10));
fis <- addvar(fis, 'input', 'food', c(0,10));
fis <- addvar(fis, 'output', 'tip', c(0,30));


fis <- addmf(fis, 'input', 1, 'poor', 'gaussmf', c(1.5, 0));
fis <- addmf(fis, 'input', 1, 'good', 'gaussmf', c(1.5, 5));
fis <- addmf(fis, 'input', 1, 'excellent', 'gaussmf', c(1.5, 10));

fis <- addmf(fis, 'input', 2, 'rancid', 'trapmf', c(0, 0, 1, 3));
fis <- addmf(fis, 'input', 2, 'delicious', 'trapmf', c(7, 9,10,10));

fis <- addmf(fis, 'output', 1, 'cheap', 'trimf', c(0, 5, 10));
fis <- addmf(fis, 'output', 1, 'average', 'trimf', c(10, 15, 20));
fis <- addmf(fis, 'output', 1, 'generous', 'trimf', c(20, 25, 30));

rulelist = rbind(c(1,1,1,1,2),c(2,0,2,1,1),c(3,2,3,1,2))
fis <- addrule(fis,rulelist)

#par(mfrow = c(3,1))
#plotmf(fis, 'input', 1, main = 'service')
#plotmf(fis, 'input', 2, main = 'food')
#plotmf(fis, 'output', 1, main = 'tip')
gensurf(fis)