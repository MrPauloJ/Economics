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
cd "..\..\..\Figures\Stata Graph\IIE\IBCR"

* Set the IRF database
irf set "impulses_IBCR_IIE.irf", replace

**************************************************************
*************************** IBCR *****************************
**************************************************************

**************************************************************
* BA - IIE - IBCR
svar IIE BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A)
irf create BA_IIE_IBCR, replace step(24)

irf graph oirf, irf(BA_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRBA) title("BA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_BA_IIE_IBCR.gph, replace

**************************************************************
* CE - IIE - IBCR
svar IIE BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A)
irf create CE_IIE_IBCR, replace step(24)

irf graph oirf, irf(CE_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRCE) title("CE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_CE_IIE_IBCR.gph, replace

**************************************************************
* ES - IIE - IBCR
svar IIE BVSP Selic IEFES IBCRES, lags(1/2) aeq(A)
irf create ES_IIE_IBCR, replace step(24)

irf graph oirf, irf(ES_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRES) title("ES") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_ES_IIE_IBCR.gph, replace

**************************************************************
* GO - IIE - IBCR
svar IIE BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A)
irf create GO_IIE_IBCR, replace step(24)

irf graph oirf, irf(GO_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRGO) title("GO") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_GO_IIE_IBCR.gph, replace

**************************************************************
* MG - IIE - IBCR
svar IIE BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A)
irf create MG_IIE_IBCR, replace step(24)

irf graph oirf, irf(MG_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRMG) title("MG") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_MG_IIE_IBCR.gph, replace

**************************************************************
* PA - IIE - IBCR
svar IIE BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A)
irf create PA_IIE_IBCR, replace step(24)

irf graph oirf, irf(PA_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRPA) title("PA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PA_IIE_IBCR.gph, replace

**************************************************************
* PR - IIE - IBCR
svar IIE BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A)
irf create PR_IIE_IBCR, replace step(24)

irf graph oirf, irf(PR_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRPR) title("PR") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PR_IIE_IBCR.gph, replace

**************************************************************
* PE - IIE - IBCR
svar IIE BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A)
irf create PE_IIE_IBCR, replace step(24)

irf graph oirf, irf(PE_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRPE) title("PE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PE_IIE_IBCR.gph, replace

**************************************************************
* RJ - IIE - IBCR
svar IIE BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A)
irf create RJ_IIE_IBCR, replace step(24)

irf graph oirf, irf(RJ_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRRJ) title("RJ") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RJ_IIE_IBCR.gph, replace

**************************************************************
* RS - IIE - IBCR
svar IIE BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A)
irf create RS_IIE_IBCR, replace step(24)

irf graph oirf, irf(RS_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRRS) title("RS") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RS_IIE_IBCR.gph, replace

**************************************************************
* SC - IIE - IBCR
svar IIE BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A)
irf create SC_IIE_IBCR, replace step(24)

irf graph oirf, irf(SC_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRSC) title("SC") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SC_IIE_IBCR.gph, replace

**************************************************************
* SP - IIE - IBCR
svar IIE BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A)
irf create SP_IIE_IBCR, replace step(24)

irf graph oirf, irf(SP_IIE_IBCR) yline(0, lcolor("black")) level(68) impulse(IIE) response(IBCRSP) title("SP") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SP_IIE_IBCR.gph, replace

**************************************************************
* Create Graph
graph combine graph_BA_IIE_IBCR.gph graph_CE_IIE_IBCR.gph graph_ES_IIE_IBCR.gph graph_GO_IIE_IBCR.gph graph_MG_IIE_IBCR.gph graph_PA_IIE_IBCR.gph graph_PR_IIE_IBCR.gph graph_PE_IIE_IBCR.gph graph_RJ_IIE_IBCR.gph graph_RS_IIE_IBCR.gph graph_SC_IIE_IBCR.gph graph_SP_IIE_IBCR.gph, rows(3) cols(4) title("IBCR - IIE Br") graphregion(color(white))
