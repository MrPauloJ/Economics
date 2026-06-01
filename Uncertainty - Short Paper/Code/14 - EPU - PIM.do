**************************************************************************
* Federal University of Pernambuco - PIMES UFPE
* Research: The Impacts of Uncertainty on Economic Activity Across Brazilian States
* Researcher: Paulo Francisco da Silva Junior
* Advisor: Marcelo Eduardo Alves da Silva, PhD.
**************************************************************************

* Clean any data
clear all

* Set main path
cd "..\Data\Processed\Time Series"

* Import data
import excel using "TUDO_general.xlsx", firstrow clear

* Natural log transformation
replace BVSP = ln(BVSP)

replace IBCRBA = ln(IBCRBA)
replace IBCRCE = ln(IBCRCE)
replace IBCRES = ln(IBCRES)
replace IBCRGO = ln(IBCRGO)
replace IBCRMG = ln(IBCRMG)
replace IBCRPA = ln(IBCRPA)
replace IBCRPR = ln(IBCRPR)
replace IBCRPE = ln(IBCRPE)
replace IBCRRJ = ln(IBCRRJ)
replace IBCRRS = ln(IBCRRS)
replace IBCRSC = ln(IBCRSC)
replace IBCRSP = ln(IBCRSP)

replace IEFBA = ln(IEFBA)
replace IEFCE = ln(IEFCE)
replace IEFES = ln(IEFES)
replace IEFGO = ln(IEFGO)
replace IEFMG = ln(IEFMG)
replace IEFPA = ln(IEFPA)
replace IEFPR = ln(IEFPR)
replace IEFPE = ln(IEFPE)
replace IEFRJ = ln(IEFRJ)
replace IEFRS = ln(IEFRS)
replace IEFSC = ln(IEFSC)
replace IEFSP = ln(IEFSP)

replace PIMBA = ln(PIMBA)
replace PIMCE = ln(PIMCE)
replace PIMES = ln(PIMES)
replace PIMGO = ln(PIMGO)
replace PIMMG = ln(PIMMG)
replace PIMPA = ln(PIMPA)
replace PIMPR = ln(PIMPR)
replace PIMPE = ln(PIMPE)
replace PIMRJ = ln(PIMRJ)
replace PIMRS = ln(PIMRS)
replace PIMSC = ln(PIMSC)
replace PIMSP = ln(PIMSP)

* Transform to a time serie
tsset time

* Set the A matrix
matrix A = (1, 0, 0, 0, 0 \ . , 1, 0, 0, 0 \ . , . , 1, 0, 0 \ . , . , . , 1, 0 \ . , . , . , . , 1)

* Set path to save graphs
cd "..\..\..\Figures\Stata Graph\EPU\PIM"

* Set the IRF database
irf set "impulses_PIM_EPU.irf", replace

**************************************************************
*************************** PIM ******************************
**************************************************************

**************************************************************
* BA - EPU - PIM
svar EPU BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A)
irf create BA_EPU_PIM, replace step(24)

irf graph oirf, irf(BA_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMBA) title("BA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_BA_EPU_PIM.gph, replace

**************************************************************
* CE - EPU - PIM
svar EPU BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A)
irf create CE_EPU_PIM, replace step(24)

irf graph oirf, irf(CE_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMCE) title("CE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_CE_EPU_PIM.gph, replace

**************************************************************
* ES - EPU - PIM
svar EPU BVSP Selic IEFES PIMES, lags(1/2) aeq(A)
irf create ES_EPU_PIM, replace step(24)

irf graph oirf, irf(ES_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMES) title("ES") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_ES_EPU_PIM.gph, replace

**************************************************************
* GO - EPU - PIM
svar EPU BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A)
irf create GO_EPU_PIM, replace step(24)

irf graph oirf, irf(GO_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMGO) title("GO") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_GO_EPU_PIM.gph, replace

**************************************************************
* MG - EPU - PIM
svar EPU BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A)
irf create MG_EPU_PIM, replace step(24)

irf graph oirf, irf(MG_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMMG) title("MG") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_MG_EPU_PIM.gph, replace

**************************************************************
* PA - EPU - PIM
svar EPU BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A)
irf create PA_EPU_PIM, replace step(24)

irf graph oirf, irf(PA_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMPA) title("PA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PA_EPU_PIM.gph, replace

**************************************************************
* PR - EPU - PIM
svar EPU BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A)
irf create PR_EPU_PIM, replace step(24)

irf graph oirf, irf(PR_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMPR) title("PR") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PR_EPU_PIM.gph, replace

**************************************************************
* PE - EPU - PIM
svar EPU BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A)
irf create PE_EPU_PIM, replace step(24)

irf graph oirf, irf(PE_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMPE) title("PE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PE_EPU_PIM.gph, replace

**************************************************************
* RJ - EPU - PIM
svar EPU BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A)
irf create RJ_EPU_PIM, replace step(24)

irf graph oirf, irf(RJ_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMRJ) title("RJ") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RJ_EPU_PIM.gph, replace

**************************************************************
* RS - EPU - PIM
svar EPU BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A)
irf create RS_EPU_PIM, replace step(24)

irf graph oirf, irf(RS_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMRS) title("RS") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RS_EPU_PIM.gph, replace

**************************************************************
* SC - EPU - PIM
svar EPU BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A)
irf create SC_EPU_PIM, replace step(24)

irf graph oirf, irf(SC_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMSC) title("SC") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SC_EPU_PIM.gph, replace

**************************************************************
* SP - EPU - PIM
svar EPU BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A)
irf create SP_EPU_PIM, replace step(24)

irf graph oirf, irf(SP_EPU_PIM) yline(0, lcolor("black")) level(68) impulse(EPU) response(PIMSP) title("SP") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SP_EPU_PIM.gph, replace

**************************************************************
* Create Graph
graph combine graph_BA_EPU_PIM.gph graph_CE_EPU_PIM.gph graph_ES_EPU_PIM.gph graph_GO_EPU_PIM.gph graph_MG_EPU_PIM.gph graph_PA_EPU_PIM.gph graph_PR_EPU_PIM.gph graph_PE_EPU_PIM.gph graph_RJ_EPU_PIM.gph graph_RS_EPU_PIM.gph graph_SC_EPU_PIM.gph graph_SP_EPU_PIM.gph, rows(3) cols(4) title("PIM - EPU Br") graphregion(color(white))




