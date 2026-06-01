##########################################################################
# Federal University of Pernambuco - PIMES UFPE
# Research: The Impacts of Uncertainty on Economic Activity Across Brazilian States
# Researcher: Paulo Francisco da Silva Junior
# Advisor: Marcelo Eduardo Alves da Silva, PhD.
##########################################################################

# Required packages
require("readxl")
require("vars")

# Call libraries
library(readxl)
library(vars)

# Define main path
path="..\\Data\\Processed\\Time Series\\"

##########################################################################
# Load data section
##########################################################################

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

# Read IIE-Br data
currentPath=paste(path,"IIE-Br.xlsx",sep="")
dadosIIE = read_excel(currentPath)
dadosIIE=data.frame(dadosIIE)

# Read GEPU data
currentPath=paste(path,"GEPU_PPP.xlsx",sep="")
dadosGEPU=read_excel(currentPath)
dadosGEPU=data.frame(dadosGEPU)

# Read EPU Br data
currentPath=paste(path,"EPU_Br.xlsx",sep="")
dadosEPU=read_excel(currentPath)
dadosEPU=data.frame(dadosEPU)

##########################################################################
# Information Criteria Analysis - Bahia
##########################################################################
# Select the lag based on information criteria
# Choose the lowest value
# Return two elements: 
# selection, a vector with optimal lag for each criteria; 
# criteria, each lag max for each criteria;
# type=c("const", "trend", "both", "none")

##########################################################################
# Bahia
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Bahia - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadoState$IBCR.BA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Bahia - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadosPIM$Bahia)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Bahia - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadoState$IBCR.BA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Bahia - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadosPIM$Bahia)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Bahia - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(dadosIIE$IIE.Br,
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadoState$IBCR.BA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Bahia - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(dadosIIE$IIE.Br,
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.BA.Desazonalizado),
            log(dadosPIM$Bahia)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Ceara
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Ceara - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadoState$IBCR.CE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Ceara - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadosPIM$Ceara)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Ceara - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadoState$IBCR.CE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Ceara - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadosPIM$Ceara)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Ceara - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadoState$IBCR.CE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Ceara - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.CE.Desazonalizado),
            log(dadosPIM$Ceara)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Espirito Santo
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Espirito Santo - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadoState$IBCR.ES.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Espirito Santo - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadosPIM$Espirito.Santo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Espirito Santo - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadoState$IBCR.ES.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Espirito Santo - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadosPIM$Espirito.Santo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Espirito Santo - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadoState$IBCR.ES.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Espirito Santo - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.ES.Desazonalizado),
            log(dadosPIM$Espirito.Santo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Goias
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Goias - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadoState$IBCR.GO.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Goias - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadosPIM$Goias)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Goias - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadoState$IBCR.GO.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Goias - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadosPIM$Goias)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Goias - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadoState$IBCR.GO.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Goias - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.GO.Desazonalizado),
            log(dadosPIM$Goias)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Minas Gerais
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Minas Gerais - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadoState$IBCR.MG.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Minas Gerais - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadosPIM$Minas.Gerais)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Minas Gerais - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadoState$IBCR.MG.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Minas Gerais - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadosPIM$Minas.Gerais)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Minas Gerais - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadoState$IBCR.MG.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Minas Gerais - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.MG.Desazonalizado),
            log(dadosPIM$Minas.Gerais)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Para
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Para - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadoState$IBCR.PA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Para - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadosPIM$Para)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Para - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadoState$IBCR.PA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Para - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadosPIM$Para)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Para - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadoState$IBCR.PA.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Para - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PA.Desazonalizado),
            log(dadosPIM$Para)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Parana
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Parana - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadoState$IBCR.PR.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Parana - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadosPIM$Parana)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Parana - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadoState$IBCR.PR.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Parana - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadosPIM$Parana)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Parana - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadoState$IBCR.PR.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Parana - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PR.Desazonalizado),
            log(dadosPIM$Parana)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Pernambuco
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Pernambuco - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadoState$IBCR.PE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Pernambuco - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadosPIM$Pernambuco)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Pernambuco - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadoState$IBCR.PE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Pernambuco - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadosPIM$Pernambuco)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Pernambuco - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadoState$IBCR.PE.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Pernambuco - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.PE.Desazonalizado),
            log(dadosPIM$Pernambuco)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Rio de Janeiro
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Rio de Janeiro - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadoState$IBCR.RJ.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio de Janeiro - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadosPIM$Rio.de.Janeiro)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio de Janeiro - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadoState$IBCR.RJ.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio de Janeiro - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadosPIM$Rio.de.Janeiro)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio de Janeiro - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadoState$IBCR.RJ.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio de Janeiro - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RJ.Desazonalizado),
            log(dadosPIM$Rio.de.Janeiro)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Rio Grande do Sul
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Rio Grande do Sul - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadoState$IBCR.RS.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio Grande do Sul - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadosPIM$Rio.Grande.do.Sul)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio Grande do Sul - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadoState$IBCR.RS.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio Grande do Sul - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadosPIM$Rio.Grande.do.Sul)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio Grande do Sul - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadoState$IBCR.RS.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Rio Grande do Sul - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.RS.Desazonalizado),
            log(dadosPIM$Rio.Grande.do.Sul)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Santa Catarina
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Santa Catarina - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadoState$IBCR.SC.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Santa Catarina - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadosPIM$Santa.Catarina)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Santa Catarina - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadoState$IBCR.SC.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Santa Catarina - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadosPIM$Santa.Catarina)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Santa Catarina - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadoState$IBCR.SC.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Santa Catarina - IIE - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SC.Desazonalizado),
            log(dadosPIM$Santa.Catarina)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

##########################################################################
# Sao Paulo
##########################################################################

# Read IBCR and IEF state data
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dadoState = read_excel(currentPath)
dadoState = data.frame(dadoState)

# Sao Paulo - EPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadoState$IBCR.SP.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Sao Paulo - EPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosEPU$EPU_Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadosPIM$Sao.Paulo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Sao Paulo - GEPU - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadoState$IBCR.SP.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Sao Paulo - GEPU - PIM - BIC - 2 Lags
VARselect(data.frame(
            log(dadosGEPU$GEPU_PPP),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadosPIM$Sao.Paulo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Sao Paulo - IIE - IBC - BIC - 2 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadoState$IBCR.SP.Desazonalizado)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

# Sao Paulo - IIE - PIM - BIC - 3 Lags
VARselect(data.frame(
            log(dadosIIE$IIE.Br),
            log(dadosIbov$BVSP),
            dadosSelic$Selic_Meta,
            log(dadoState$IEF.SP.Desazonalizado),
            log(dadosPIM$Sao.Paulo)),
            lag.max=20, type=c("const", "trend", "both", "none"),
            season = NULL, exogen = NULL)

