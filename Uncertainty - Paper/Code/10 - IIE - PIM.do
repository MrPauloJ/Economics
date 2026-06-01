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
cd "..\..\..\Figures\Stata Graph\IIE\PIM"

* Set the IRF database
irf set "impulses_PIM_IIE.irf", replace

**************************************************************
*************************** PIM ******************************
**************************************************************

**************************************************************
* BA - IIE - PIM
svar IIE BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A)
irf create BA_IIE_PIM, replace step(24)

irf graph oirf, irf(BA_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMBA) title("BA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_BA_IIE_PIM.gph, replace

**************************************************************
* CE - IIE - PIM
svar IIE BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A)
irf create CE_IIE_PIM, replace step(24)

irf graph oirf, irf(CE_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMCE) title("CE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_CE_IIE_PIM.gph, replace

**************************************************************
* ES - IIE - PIM
svar IIE BVSP Selic IEFES PIMES, lags(1/2) aeq(A)
irf create ES_IIE_PIM, replace step(24)

irf graph oirf, irf(ES_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMES) title("ES") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_ES_IIE_PIM.gph, replace

**************************************************************
* GO - IIE - PIM
svar IIE BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A)
irf create GO_IIE_PIM, replace step(24)

irf graph oirf, irf(GO_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMGO) title("GO") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_GO_IIE_PIM.gph, replace

**************************************************************
* MG - IIE - PIM
svar IIE BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A)
irf create MG_IIE_PIM, replace step(24)

irf graph oirf, irf(MG_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMMG) title("MG") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_MG_IIE_PIM.gph, replace

**************************************************************
* PA - IIE - PIM
svar IIE BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A)
irf create PA_IIE_PIM, replace step(24)

irf graph oirf, irf(PA_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMPA) title("PA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PA_IIE_PIM.gph, replace

**************************************************************
* PR - IIE - PIM
svar IIE BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A)
irf create PR_IIE_PIM, replace step(24)

irf graph oirf, irf(PR_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMPR) title("PR") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PR_IIE_PIM.gph, replace

**************************************************************
* PE - IIE - PIM
svar IIE BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A)
irf create PE_IIE_PIM, replace step(24)

irf graph oirf, irf(PE_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMPE) title("PE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PE_IIE_PIM.gph, replace

**************************************************************
* RJ - IIE - PIM
svar IIE BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A)
irf create RJ_IIE_PIM, replace step(24)

irf graph oirf, irf(RJ_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMRJ) title("RJ") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RJ_IIE_PIM.gph, replace

**************************************************************
* RS - IIE - PIM
svar IIE BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A)
irf create RS_IIE_PIM, replace step(24)

irf graph oirf, irf(RS_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMRS) title("RS") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RS_IIE_PIM.gph, replace

**************************************************************
* SC - IIE - PIM
svar IIE BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A)
irf create SC_IIE_PIM, replace step(24)

irf graph oirf, irf(SC_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMSC) title("SC") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SC_IIE_PIM.gph, replace

**************************************************************
* SP - IIE - PIM
svar IIE BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A)
irf create SP_IIE_PIM, replace step(24)

irf graph oirf, irf(SP_IIE_PIM) yline(0, lcolor("black")) level(68) impulse(IIE) response(PIMSP) title("SP") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SP_IIE_PIM.gph, replace

**************************************************************
* Create Graph
graph combine graph_BA_IIE_PIM.gph graph_CE_IIE_PIM.gph graph_ES_IIE_PIM.gph graph_GO_IIE_PIM.gph graph_MG_IIE_PIM.gph graph_PA_IIE_PIM.gph graph_PR_IIE_PIM.gph graph_PE_IIE_PIM.gph graph_RJ_IIE_PIM.gph graph_RS_IIE_PIM.gph graph_SC_IIE_PIM.gph graph_SP_IIE_PIM.gph, rows(3) cols(4) title("PIM - IIE Br") graphregion(color(white))

