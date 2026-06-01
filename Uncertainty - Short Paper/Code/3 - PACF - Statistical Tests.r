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

##########################################################################
# Read data and run Partial Auto correlation Function (ACF)
##########################################################################

# General production data
currentPath=paste(path,"PIM_PF_Desazonalizado.xlsx",sep="")
dadosPIM = read_excel(currentPath)
dadosPIM = data.frame(dadosPIM)

##################################### EPU
currentPath=paste(path,"EPU_BR.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)
# EPU_Br - 1 lag
pacf(dados["EPU_Br"])

##################################### GEPU
currentPath=paste(path,"GEPU_PPP.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)
# GEPU_PPP - 2 lags
pacf(dados["GEPU_PPP"])

##################################### IIE-Br
currentPath=paste(path,"IIE-Br.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)
# IIE_Br - 1 lag
pacf(dados["IIE.Br"])

##################################### Bahia
currentPath=paste(path,"Bahia_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-BA- - 2 lags
pacf(dados["IBCR.BA.Desazonalizado"])
# IEF-BA - 1 lag
pacf(dados["IEF.BA.Desazonalizado"])
# PIM-BA - 3 lags
pacf(dadosPIM["Bahia"])

##################################### Ceara
currentPath=paste(path,"Ceara_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-CE- - 1 lag
pacf(dados["IBCR.CE.Desazonalizado"])
# IEF-CE - 1 lag
pacf(dados["IEF.CE.Desazonalizado"])
# PIM-CE - 3 lags
pacf(dadosPIM["Ceara"])

##################################### Espirito Santo
currentPath=paste(path,"Espirito Santo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-ES- - 1 lag
pacf(dados["IBCR.ES.Desazonalizado"])
# IEF-CE - 1 lag
pacf(dados["IEF.ES.Desazonalizado"])
# PIM-CE - 1 lag
pacf(dadosPIM["Espirito.Santo"])

##################################### Goias
currentPath=paste(path,"Goias_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-GO- - 1 lag
pacf(dados["IBCR.GO.Desazonalizado"])
# IEF-GO - 1 lag
pacf(dados["IEF.GO.Desazonalizado"])
# PIM-GO - 2 lags
pacf(dadosPIM["Goias"])

##################################### Minas Gerais
currentPath=paste(path,"Minas Gerais_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-MG- - 1 lag
pacf(dados["IBCR.MG.Desazonalizado"])
# IEF-MG - 1 lag
pacf(dados["IEF.MG.Desazonalizado"])
# PIM-MG - 1 lag
pacf(dadosPIM["Minas.Gerais"])

##################################### Para
currentPath=paste(path,"Para_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-PA- - 1 lag
pacf(dados["IBCR.PA.Desazonalizado"])
# IEF-PA - 1 lag
pacf(dados["IEF.PA.Desazonalizado"])
# PIM-PA - 2 lags
pacf(dadosPIM["Para"])

##################################### Parana
currentPath=paste(path,"Parana_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-PR- - 1 lag
pacf(dados["IBCR.PR.Desazonalizado"])
# IEF-PR - 1 lag
pacf(dados["IEF.PR.Desazonalizado"])
# PIM-PR - 2 lags
pacf(dadosPIM["Parana"])

##################################### Pernambuco
currentPath=paste(path,"Pernambuco_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-PE- - 1 lag
pacf(dados["IBCR.PE.Desazonalizado"])
# IEF-PE - 1 lag
pacf(dados["IEF.PE.Desazonalizado"])
# PIM-PE - 2 lags
pacf(dadosPIM["Pernambuco"])

##################################### Rio de Janeiro
currentPath=paste(path,"Rio de Janeiro_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-RJ- - 1 lag
pacf(dados["IBCR.RJ.Desazonalizado"])
# IEF-RJ - 1 lag
pacf(dados["IEF.RJ.Desazonalizado"])
# PIM-RJ - 3 lags
pacf(dadosPIM["Rio.de.Janeiro"])

##################################### Rio Grande do Sul
currentPath=paste(path,"Rio Grande do Sul_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-RS- - 2 lags
pacf(dados["IBCR.RS.Desazonalizado"])
# IEF-RS - 1 lag
pacf(dados["IEF.RS.Desazonalizado"])
# PIM-RS - 1 lag
pacf(dadosPIM["Rio.Grande.do.Sul"])

##################################### Santa Catarina
currentPath=paste(path,"Santa Catarina_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-SC- - 1 lag
pacf(dados["IBCR.SC.Desazonalizado"])
# IEF-SC - 1 lag
pacf(dados["IEF.SC.Desazonalizado"])
# PIM-SC - 2 lags
pacf(dadosPIM["Santa.Catarina"])

##################################### Sao Paulo
currentPath=paste(path,"Sao Paulo_IEF_IBC.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# IBCR-SP- - 1 lag
pacf(dados["IBCR.SP.Desazonalizado"])
# IEF-SP - 1 lag
pacf(dados["IEF.SP.Desazonalizado"])
# PIM-SP - 3 lags
pacf(dadosPIM["Sao.Paulo"])

##################################### Selic Meta
currentPath=paste(path,"Selic_Meta.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Selic Meta - 2 lags
pacf(dados["Selic_Meta"])

##################################### Ibovespa
currentPath=paste(path,"BVSP.xlsx",sep="")
dados = read_excel(currentPath)
dados = data.frame(dados)

# Bovespa - 1 lag
pacf(dados["BVSP"])

