##########################################################################
# Federal University of Pernambuco - PIMES UFPE
# Research: The Impacts of Uncertainty on Economic Activity Across Brazilian States
# Researcher: Paulo Francisco da Silva Junior
# Advisor: Marcelo Eduardo Alves da Silva, PhD.
##########################################################################

# Requirements
require(seasonal)
require(readxl)
require(writexl)

# Call libraries
library(seasonal)
library(readxl)
library(writexl)

# Define main path
path="..\\Data\\Processed\\Time Series\\"

# Variables to help loop interaction
# States name and short abreviation
estados=c("Bahia", "Ceara", "Espirito Santo", "Goias", "Minas Gerais", "Para", "Parana", "Pernambuco", "Rio de Janeiro", "Rio Grande do Sul", "Santa Catarina", "Sao Paulo")
estados_sigla=c("BA", "CE", "ES", "GO", "MG", "PA", "PR", "PE", "RJ", "RS","SC", "SP")

# Run x13-ARIMA for each IEF variable in each state
for (i in 1:length(estados)){
    currentPath=paste(path,estados[i],"_IEF_IBC.xlsx",sep="")
    data_df=read_excel(currentPath)
    data_df=data.frame(data_df)
    serie_temp=ts(data_df[4], start = c(2004,1), frequency = 12)
    serie_temp <- seas(serie_temp)
    serie_temp <- final(serie_temp)
    data_df[paste("IEF.", estados_sigla[i],".Desazonalizado",sep="")]=serie_temp
    write_xlsx(data_df, currentPath)
    # Check if there are any NA
    print(paste(estados[i], "- NA:",sum(is.na(data_df))))
}

















