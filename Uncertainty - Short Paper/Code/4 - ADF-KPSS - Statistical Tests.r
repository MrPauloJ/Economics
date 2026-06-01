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

##########################################################################
# Dickey Fuller (ADF) and KPSS tests
##########################################################################

# Dickey Fuller Test (H0: Unity Root) - In level
# If it rejects the null hypothesis then: Stationary Serie
# summary(ur.df(dados[BVSP], type=c("trend", "none", "drift"), selectlags=c("Fixed", "AIC", "BIC"), lags=1))
# "none": Default Dickey-Fuller test, i.e, without trend or costant;
# "drift": Augmented Dickey-Fuller test, i.e., with constant;
# "trend": Augmented Dickey-Fuller test, i.e., with constant and trend;
# lags: Number of lags
# selectlags: method to select the number of lags; Fixed, AIC, or BIC

# KPSS test (H0: Stationary around deterministic trend)
# summary(ur.kpss(serie, type=c("tau","mu"), lags=c("short","long", "nil"), use.lag=NULL))
# If it does not reject the null hypothesis - Stationary
# Deterministic component either a constant "mu" or
# a constant with linear trend "tau"

# Define main path
path="..\\Data\\Processed\\Time Series\\"

# Read data of state production
currentPath=paste(path,"PIM_PF_Desazonalizado.xlsx",sep="")
dadosPIM = read_excel(currentPath)
dadosPIM = data.frame(dadosPIM)

##########################################################################
# EPU Br
##########################################################################
currentPath=paste(path,"EPU_BR.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does reject the null hypothesis - Stationary
summary(ur.df(dados$EPU_Br, type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(dados$EPU_Br, type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(dados$EPU_Br, type="trend"))

# Does reject the null hypothesis - Stationary around trend
summary(ur.kpss(dados$EPU_Br, type="tau"))

##########################################################################
# GEPU PPP
##########################################################################
currentPath=paste(path,"GEPU_PPP.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$GEPU_PPP, type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$GEPU_PPP, type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary (5%, 10% only)
summary(ur.df(dados$GEPU_PPP, type="trend"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(diff(dados$GEPU_PPP), type="trend"))

# Does reject the null hypothesis - Stationary around trend
summary(ur.kpss(dados$GEPU_PPP, type="tau"))

##########################################################################
# IIE Br
##########################################################################
currentPath=paste(path,"IIE-Br.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$IIE.Br, type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(dados$IIE.Br, type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(dados$IIE.Br, type="trend"))

# Type: None - Does reject the null hypothesis - Stationary
summary(ur.df(diff(dados$IIE.Br), type="none"))

# Does reject the null hypothesis - Stationary around trend
summary(ur.kpss(dados$IIE.Br, type="tau"))

##########################################################################
# Ibovespa
##########################################################################
currentPath=paste(path,"BVSP.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$BVSP), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$BVSP), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$BVSP), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$BVSP)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$BVSP), type="tau"))

##########################################################################
# Selic_Meta
##########################################################################
currentPath=paste(path,"Selic_Meta.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$Selic_Meta, type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$Selic_Meta, type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(dados$Selic_Meta, type="trend"))

# Does reject the null hypothesis - Stationary - I(1)
summary(ur.df(diff(dados$Selic_Meta), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(dados$Selic_Meta, type="tau"))

##########################################################################
# Bahia IBCR
##########################################################################
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.BA.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.BA.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.BA.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.BA.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.BA.Desazonalizado), type="tau"))

##########################################################################
# Bahia IEF
##########################################################################
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.BA.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.BA.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.BA.Desazonalizado), type="trend"))

# Does not reject the null hypothesis - Non-Starionary I(1)
summary(ur.df(diff(log(dados$IEF.BA.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.BA.Desazonalizado), type="tau"))

##########################################################################
# Bahia PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Bahia), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dadosPIM$Bahia), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(log(dadosPIM$Bahia), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Bahia)), type="none"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Bahia), type="tau"))

##########################################################################
# Ceara IBCR
##########################################################################
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.CE.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.CE.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.CE.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.CE.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.CE.Desazonalizado), type="tau"))

##########################################################################
# Ceara IEF
##########################################################################
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.CE.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dados$IEF.CE.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.CE.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dados$IEF.CE.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.CE.Desazonalizado), type="tau"))

##########################################################################
# Ceara PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Ceara), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Ceara), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary (for 5%, 10%)
summary(ur.df(log(dadosPIM$Ceara), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Ceara)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Bahia), type="tau"))

##########################################################################
# Espirito Santo IBCR
##########################################################################
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.ES.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.ES.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.ES.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.ES.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.ES.Desazonalizado), type="tau"))

##########################################################################
# Espirito Santo IEF
##########################################################################
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.ES.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IEF.ES.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.ES.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1) (for 5%, 10%) 
summary(ur.df(diff(log(dados$IEF.ES.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.ES.Desazonalizado), type="tau"))

##########################################################################
# Espirito Santo PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Espirito.Santo), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Espirito.Santo), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Espirito.Santo), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Espirito.Santo)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Espirito.Santo), type="tau"))

##########################################################################
# Goias IBCR
##########################################################################
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.GO.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.GO.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.GO.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.GO.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.GO.Desazonalizado), type="tau"))

##########################################################################
# Goias IEF
##########################################################################
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.GO.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IEF.GO.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.GO.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dados$IEF.GO.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.GO.Desazonalizado), type="tau"))

##########################################################################
# Goias PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Goias), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Goias), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(log(dadosPIM$Goias), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Goias)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Goias), type="tau"))

##########################################################################
# Minas Gerais IBCR
##########################################################################
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.MG.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.MG.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.MG.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.MG.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.MG.Desazonalizado), type="tau"))

##########################################################################
# Minas Gerais IEF
##########################################################################
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.MG.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dados$IEF.MG.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.MG.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1) 
summary(ur.df(diff(log(dados$IEF.MG.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.MG.Desazonalizado), type="tau"))

##########################################################################
# Minas Gerais PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Minas.Gerais), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Minas.Gerais), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Minas.Gerais), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Minas.Gerais)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Minas.Gerais), type="tau"))

##########################################################################
# Para IBCR
##########################################################################
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PA.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PA.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PA.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.PA.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.PA.Desazonalizado), type="tau"))

##########################################################################
# Para IEF
##########################################################################
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PA.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%,10%)
summary(ur.df(log(dados$IEF.PA.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PA.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1) 
summary(ur.df(diff(log(dados$IEF.PA.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.PA.Desazonalizado), type="tau"))

##########################################################################
# Para PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Para), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Para), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(log(dadosPIM$Para), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Para)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Para), type="tau"))

##########################################################################
# Parana IBCR
##########################################################################
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PR.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PR.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PR.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.PR.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.PR.Desazonalizado), type="tau"))

##########################################################################
# Parana IEF
##########################################################################
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PR.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%,10%)
summary(ur.df(log(dados$IEF.PR.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PR.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dados$IEF.PR.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.PR.Desazonalizado), type="tau"))

##########################################################################
# Parana PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Parana), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Parana), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Parana), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Parana)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Parana), type="tau"))

##########################################################################
# Pernambuco IBCR
##########################################################################
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PE.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PE.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.PE.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.PE.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.PE.Desazonalizado), type="tau"))

##########################################################################
# Pernambuco IEF
##########################################################################
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PE.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IEF.PE.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.PE.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dados$IEF.PE.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.PE.Desazonalizado), type="tau"))

##########################################################################
# Pernambuco PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Pernambuco), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dadosPIM$Pernambuco), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Pernambuco), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Pernambuco)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Pernambuco), type="tau"))

##########################################################################
# Rio de Janeiro IBCR
##########################################################################
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.RJ.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dados$IBCR.RJ.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.RJ.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.RJ.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.RJ.Desazonalizado), type="tau"))

##########################################################################
# Rio de Janeiro IEF
##########################################################################
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.RJ.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dados$IEF.RJ.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.RJ.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dados$IEF.RJ.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.RJ.Desazonalizado), type="tau"))

##########################################################################
# Rio de Janeiro PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Rio.de.Janeiro), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Rio.de.Janeiro), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Rio.de.Janeiro), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Rio.de.Janeiro)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(dadosPIM$Pernambuco, type="tau"))

##########################################################################
# Rio Grande do Sul IBCR
##########################################################################
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.RS.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.RS.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.RS.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.RS.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.RS.Desazonalizado), type="tau"))

##########################################################################
# Rio Grande do Sul IEF
##########################################################################
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.RS.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.RS.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.RS.Desazonalizado), type="trend"))

# Does not reject the null hypothesis - Non-Starionary
summary(ur.df(diff(log(dados$IEF.RS.Desazonalizado)), type="trend"))

# Does reject the null hypothesis - Starionary I(2)
summary(ur.df(diff(diff(log(dados$IEF.RS.Desazonalizado))), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.RS.Desazonalizado), type="tau"))

##########################################################################
# Rio Grande do Sul PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Rio.Grande.do.Sul), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary (5%, 10% only)
summary(ur.df(log(dadosPIM$Rio.Grande.do.Sul), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dadosPIM$Rio.Grande.do.Sul), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Rio.Grande.do.Sul)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Rio.Grande.do.Sul), type="tau"))

##########################################################################
# Santa Catarina IBCR
##########################################################################
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.SC.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.SC.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.SC.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.SC.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.SC.Desazonalizado), type="tau"))

##########################################################################
# Santa Catarina IEF
##########################################################################
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.SC.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IEF.SC.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.SC.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary I(1) (10%)
summary(ur.df(diff(log(dados$IEF.SC.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.SC.Desazonalizado), type="tau"))

##########################################################################
# Santa Catarina PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Santa.Catarina), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Santa.Catarina), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary (5%, 10%)
summary(ur.df(log(dadosPIM$Santa.Catarina), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Santa.Catarina)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Santa.Catarina), type="tau"))

##########################################################################
# Sao Paulo IBCR
##########################################################################
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.SP.Desazonalizado), type="none"))

# Type: Drift - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IBCR.SP.Desazonalizado), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IBCR.SP.Desazonalizado), type="trend"))

# Does reject the null hypothesis - Starionary - I(1)
summary(ur.df(diff(log(dados$IBCR.SP.Desazonalizado)), type="trend"))

# Does not reject the null hypothesis - Stationary around Trend
summary(ur.kpss(log(dados$IBCR.SP.Desazonalizado), type="tau"))

##########################################################################
# Sao Paulo IEF
##########################################################################
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.SP.Desazonalizado), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dados$IEF.SP.Desazonalizado), type="drift"))

# Type: Trend - Does reject the null hypothesis - Stationary
summary(ur.df(log(dados$IEF.SP.Desazonalizado), type="trend"))

# Does not reject the null hypothesis - Non-Starionary
summary(ur.df(diff(log(dados$IEF.SP.Desazonalizado)), type="trend"))

# Does reject the null hypothesis - Starionary I(2)
summary(ur.df(diff(diff(log(dados$IEF.SP.Desazonalizado))), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dados$IEF.SP.Desazonalizado), type="tau"))

##########################################################################
# Sao Paulo PIM
##########################################################################

# Type: None - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Sao.Paulo), type="none"))

# Type: Drift - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Sao.Paulo), type="drift"))

# Type: Trend - Does not reject the null hypothesis - Non-Stationary
summary(ur.df(log(dadosPIM$Sao.Paulo), type="trend"))

# Does reject the null hypothesis - Starionary I(1)
summary(ur.df(diff(log(dadosPIM$Sao.Paulo)), type="trend"))

# Does not reject the null hypothesis - Stationary around trend
summary(ur.kpss(log(dadosPIM$Sao.Paulo), type="tau"))
