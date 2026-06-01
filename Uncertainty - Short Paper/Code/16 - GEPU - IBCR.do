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
cd "..\..\..\Figures\Stata Graph\GEPU\IBCR"

* Set the IRF database
irf set "impulses_IBCR_GEPU.irf", replace

**************************************************************
*************************** IBCR *****************************
**************************************************************

**************************************************************
* BA - GEPU - IBCR
svar GEPU BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A)
irf create BA_GEPU_IBCR, replace step(24)

irf graph oirf, irf(BA_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRBA) title("BA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_BA_GEPU_IBCR.gph, replace

**************************************************************
* CE - GEPU - IBCR
svar GEPU BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A)
irf create CE_GEPU_IBCR, replace step(24)

irf graph oirf, irf(CE_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRCE) title("CE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_CE_GEPU_IBCR.gph, replace

**************************************************************
* ES - GEPU - IBCR
svar GEPU BVSP Selic IEFES IBCRES, lags(1/2) aeq(A)
irf create ES_GEPU_IBCR, replace step(24)

irf graph oirf, irf(ES_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRES) title("ES") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_ES_GEPU_IBCR.gph, replace

**************************************************************
* GO - GEPU - IBCR
svar GEPU BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A)
irf create GO_GEPU_IBCR, replace step(24)

irf graph oirf, irf(GO_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRGO) title("GO") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_GO_GEPU_IBCR.gph, replace

**************************************************************
* MG - GEPU - IBCR
svar GEPU BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A)
irf create MG_GEPU_IBCR, replace step(24)

irf graph oirf, irf(MG_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRMG) title("MG") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_MG_GEPU_IBCR.gph, replace

**************************************************************
* PA - GEPU - IBCR
svar GEPU BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A)
irf create PA_GEPU_IBCR, replace step(24)

irf graph oirf, irf(PA_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRPA) title("PA") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PA_GEPU_IBCR.gph, replace

**************************************************************
* PR - GEPU - IBCR
svar GEPU BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A)
irf create PR_GEPU_IBCR, replace step(24)

irf graph oirf, irf(PR_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRPR) title("PR") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PR_GEPU_IBCR.gph, replace

**************************************************************
* PE - GEPU - IBCR
svar GEPU BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A)
irf create PE_GEPU_IBCR, replace step(24)

irf graph oirf, irf(PE_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRPE) title("PE") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_PE_GEPU_IBCR.gph, replace

**************************************************************
* RJ - GEPU - IBCR
svar GEPU BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A)
irf create RJ_GEPU_IBCR, replace step(24)

irf graph oirf, irf(RJ_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRRJ) title("RJ") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RJ_GEPU_IBCR.gph, replace

**************************************************************
* RS - GEPU - IBCR
svar GEPU BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A)
irf create RS_GEPU_IBCR, replace step(24)

irf graph oirf, irf(RS_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRRS) title("RS") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_RS_GEPU_IBCR.gph, replace

**************************************************************
* SC - GEPU - IBCR
svar GEPU BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A)
irf create SC_GEPU_IBCR, replace step(24)

irf graph oirf, irf(SC_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRSC) title("SC") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SC_GEPU_IBCR.gph, replace

**************************************************************
* SP - GEPU - IBCR
svar GEPU BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A)
irf create SP_GEPU_IBCR, replace step(24)

irf graph oirf, irf(SP_GEPU_IBCR) yline(0, lcolor("black")) level(68) impulse(GEPU) response(IBCRSP) title("SP") subtitle("") xtitle("") ytitle("") ciopts(lpattern(dash) color(red) fcolor(none)) graphregion(color(white)) legend(off) note("") individual
graph save graph_SP_GEPU_IBCR.gph, replace

**************************************************************
* Create Graph
graph combine graph_BA_GEPU_IBCR.gph graph_CE_GEPU_IBCR.gph graph_ES_GEPU_IBCR.gph graph_GO_GEPU_IBCR.gph graph_MG_GEPU_IBCR.gph graph_PA_GEPU_IBCR.gph graph_PR_GEPU_IBCR.gph graph_PE_GEPU_IBCR.gph graph_RJ_GEPU_IBCR.gph graph_RS_GEPU_IBCR.gph graph_SC_GEPU_IBCR.gph graph_SP_GEPU_IBCR.gph, rows(3) cols(4) title("IBCR - GEPU") graphregion(color(white))



