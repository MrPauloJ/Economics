##########################################################################
# Federal University of Pernambuco - PIMES UFPE
# Research: The Impacts of Uncertainty on Economic Activity Across Brazilian States
# Researcher: Paulo Francisco da Silva Junior
# Advisor: Marcelo Eduardo Alves da Silva, PhD.
##########################################################################

# Required packages
require("readxl")
require("urca")

# Call libraries
library(urca)
library(readxl)

# Define main path
path="..\\Data\\Processed\\Time Series\\"

# Read production data
currentPath=paste(path,"PIM_PF_Desazonalizado.xlsx",sep="")
dadosPIM = read_excel(currentPath)
dadosPIM=data.frame(dadosPIM)

# Read Ibovespa index data
currentPath=paste(path,"BVSP.xlsx",sep="")
dadosIbov = read_excel(currentPath)
dadosIbov = data.frame(dadosIbov)

# Read selic data
currentPath=paste(path,"Selic_Meta.xlsx",sep="")
dadosSelic = read_excel(currentPath)
dadosSelic = data.frame(dadosSelic)

##########################################################################
# Jonhansen test
# ca.jo(data,type=c("trace", "eigen"), k=2, ecdet=c("none", "const", "trend"), spec=c("longrun", "transitory")) 
# trace: test if r>=x and r>x; if test-value greater than crital so reject H0
# H0: No integration at r>=x and r>x
# eigen: test if r>x
# k specify the number of lags. Minimum=2;
# ecdet specify the type of model
# none: without constant or trend
# const: with a constante but no trend
# trend: with constant and trend
# spec: longrun vs transitory (autoexplicated)
##########################################################################

##########################################################################
# Bahia
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.BA.Desazonalizado)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Bahia)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Ceara
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.CE.Desazonalizado)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Ceara)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Espirito Santo
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.ES.Desazonalizado)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Espirito.Santo)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Goias
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all leves
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.GO.Desazonalizado)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Goias)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Minas Gerais
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.MG.Desazonalizado)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Minas.Gerais)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Para
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PA.Desazonalizado)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Para)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Parana
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PR.Desazonalizado)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Parana)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Pernambuco
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PE.Desazonalizado)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Pernambuco)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Rio de Janeiro
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RJ.Desazonalizado)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.de.Janeiro)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Rio Grande do Sul
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RS.Desazonalizado)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.Grande.do.Sul)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Santa Catarina
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SC.Desazonalizado)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Santa.Catarina)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Sao Paulo
##########################################################################

# Read index of activity and employment data
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SP.Desazonalizado)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Sao.Paulo)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Cointegration test - Engle & Granger Test
# Run the regression without constant or trend
# Run the default DF test for the residuals
# H0: there is U.R -> No cointegration
# H1: there isn't U.R -> There is cointegration
##########################################################################


##########################################################################
##########################################################################
############################ Futher tests ################################
##########################################################################
##########################################################################
# OBS: GEPU and IIE also cointegrated with series

# Read IIE-Br data
currentPath=paste(path,"IIE-Br.xlsx",sep="")
dadosIIE = read_excel(currentPath)
dadosIIE=data.frame(dadosIIE)

# Read GEPU data
currentPath=paste(path,"GEPU_PPP.xlsx",sep="")
dadosGEPU = read_excel(currentPath)
dadosGEPU=data.frame(dadosGEPU)

##########################################################################
# Bahia - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.BA.Desazonalizado)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Bahia)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Bahia - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.BA.Desazonalizado)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Bahia)),
                        diff(log(dadosI$IEF.BA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Ceara - IIE
##########################################################################

# Read IBCR and IEF Bahia data
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.CE.Desazonalizado)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Ceara)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Ceara - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.CE.Desazonalizado)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Ceara)),
                        diff(log(dadosI$IEF.CE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Espirito Santo - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.ES.Desazonalizado)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 10% and 5%
summary(ca.jo(data.frame(diff(log(dadosPIM$Espirito.Santo)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Espirito Santo - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at 10% and 5%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.ES.Desazonalizado)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 10% and 5%
summary(ca.jo(data.frame(diff(log(dadosPIM$Espirito.Santo)),
                        diff(log(dadosI$IEF.ES.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Goias - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.GO.Desazonalizado)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Goias)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Goias - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.GO.Desazonalizado)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Goias)),
                        diff(log(dadosI$IEF.GO.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Minas Gerais - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.MG.Desazonalizado)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Minas.Gerais)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Minas Gerais - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.MG.Desazonalizado)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Minas.Gerais)),
                        diff(log(dadosI$IEF.MG.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))


##########################################################################
# Para - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PA.Desazonalizado)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Para)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Para - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PA.Desazonalizado)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Para)),
                        diff(log(dadosI$IEF.PA.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Parana - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PR.Desazonalizado)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Parana)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Parana - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PR.Desazonalizado)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Parana)),
                        diff(log(dadosI$IEF.PR.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Pernambuco - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PE.Desazonalizado)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Pernambuco)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Pernambuco - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.PE.Desazonalizado)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Pernambuco)),
                        diff(log(dadosI$IEF.PE.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Rio de Janeiro - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RJ.Desazonalizado)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.de.Janeiro)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Rio de Janeiro - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RJ.Desazonalizado)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.de.Janeiro)),
                        diff(log(dadosI$IEF.RJ.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Rio Grande do Sul - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RS.Desazonalizado)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.Grande.do.Sul)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Rio Grande do Sul - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.RS.Desazonalizado)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosPIM$Rio.Grande.do.Sul)),
                        diff(log(dadosI$IEF.RS.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Santa Catarina - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SC.Desazonalizado)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Santa.Catarina)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Santa Catarina - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at all levels
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SC.Desazonalizado)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Santa.Catarina)),
                        diff(log(dadosI$IEF.SC.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

##########################################################################
# Sao Paulo - IIE
##########################################################################

# Read IBCR and IEF data
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dadosI = read_excel(currentPath)
dadosI=data.frame(dadosI)

# Johansen test - IBCR - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SP.Desazonalizado)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

# Johansen test - PIM - Rank:4 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Sao.Paulo)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosIIE$IIE.Br)), type="trace", K=2,
                        ecdet="none"))

##########################################################################
# Sao Paulo - GEPU
##########################################################################

# Johansen test - IBCR - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosI$IBCR.SP.Desazonalizado)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))

# Johansen test - PIM - Rank:5 at 5% and 10%
summary(ca.jo(data.frame(diff(log(dadosPIM$Sao.Paulo)),
                        diff(log(dadosI$IEF.SP.Desazonalizado)),
                        diff(log(dadosIbov$BVSP)),
                        diff(dadosSelic$Selic_Meta),
                        diff(dadosGEPU$GEPU_PPP)), type="trace", K=2, 
                        ecdet="none"))
