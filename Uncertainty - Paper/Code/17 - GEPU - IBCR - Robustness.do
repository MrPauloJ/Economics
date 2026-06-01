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
matrix B = (1, 0, 0, 0 \ . , 1, 0, 0 \ . , . , 1, 0 \ . , . , . , 1)

* Set path to save graphs
cd "..\..\..\Figures\Stata Graph\GEPU\Robustness\IBCR"

* Set the IRF database
irf set "impulses_IBCR_GEPU_robustness.irf", replace

**************************************************************
*************************** IBCR *****************************
**************************************************************

**************************************************************
* BA - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRBA, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFBA IBCRBA, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRBA IEFBA Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRBA IEFBA Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRBA oirf) (GEPU_IBCR_1 GEPU IBCRBA oirf) (GEPU_IBCR_2 GEPU IBCRBA oirf) (GEPU_IBCR_3 GEPU IBCRBA oirf) (GEPU_IBCR_4 GEPU IBCRBA oirf) (GEPU_IBCR_5 GEPU IBCRBA oirf) (GEPU_IBCR_6 GEPU IBCRBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

graph save graph_BA_GEPU_IBCR_robustness.gph, replace

**************************************************************
* CE - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRCE, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFCE IBCRCE, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRCE IEFCE Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRCE IEFCE Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRCE oirf) (GEPU_IBCR_1 GEPU IBCRCE oirf) (GEPU_IBCR_2 GEPU IBCRCE oirf) (GEPU_IBCR_3 GEPU IBCRCE oirf) (GEPU_IBCR_4 GEPU IBCRCE oirf) (GEPU_IBCR_5 GEPU IBCRCE oirf) (GEPU_IBCR_6 GEPU IBCRCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_CE_GEPU_IBCR_robustness.gph, replace

**************************************************************
* ES - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFES IBCRES, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFES IBCRES, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRES, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFES IBCRES, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRES IEFES Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRES IEFES Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRES oirf) (GEPU_IBCR_1 GEPU IBCRES oirf) (GEPU_IBCR_2 GEPU IBCRES oirf) (GEPU_IBCR_3 GEPU IBCRES oirf) (GEPU_IBCR_4 GEPU IBCRES oirf) (GEPU_IBCR_5 GEPU IBCRES oirf) (GEPU_IBCR_6 GEPU IBCRES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_ES_GEPU_IBCR_robustness.gph, replace

**************************************************************
* GO - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRGO, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFGO IBCRGO, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRGO IEFGO Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRGO IEFGO Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRGO oirf) (GEPU_IBCR_1 GEPU IBCRGO oirf) (GEPU_IBCR_2 GEPU IBCRGO oirf) (GEPU_IBCR_3 GEPU IBCRGO oirf) (GEPU_IBCR_4 GEPU IBCRGO oirf) (GEPU_IBCR_5 GEPU IBCRGO oirf) (GEPU_IBCR_6 GEPU IBCRGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_GO_GEPU_IBCR_robustness.gph, replace

**************************************************************
* MG - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRMG, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFMG IBCRMG, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRMG IEFMG Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRMG IEFMG Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRMG oirf) (GEPU_IBCR_1 GEPU IBCRMG oirf) (GEPU_IBCR_2 GEPU IBCRMG oirf) (GEPU_IBCR_3 GEPU IBCRMG oirf) (GEPU_IBCR_4 GEPU IBCRMG oirf) (GEPU_IBCR_5 GEPU IBCRMG oirf) (GEPU_IBCR_6 GEPU IBCRMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_MG_GEPU_IBCR_robustness.gph, replace

**************************************************************
* PA - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRPA, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFPA IBCRPA, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPA IEFPA Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPA IEFPA Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRPA oirf) (GEPU_IBCR_1 GEPU IBCRPA oirf) (GEPU_IBCR_2 GEPU IBCRPA oirf) (GEPU_IBCR_3 GEPU IBCRPA oirf) (GEPU_IBCR_4 GEPU IBCRPA oirf) (GEPU_IBCR_5 GEPU IBCRPA oirf) (GEPU_IBCR_6 GEPU IBCRPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PA_GEPU_IBCR_robustness.gph, replace

**************************************************************
* PR - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRPR, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFPR IBCRPR, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPR IEFPR Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPR IEFPR Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRPR oirf) (GEPU_IBCR_1 GEPU IBCRPR oirf) (GEPU_IBCR_2 GEPU IBCRPR oirf) (GEPU_IBCR_3 GEPU IBCRPR oirf) (GEPU_IBCR_4 GEPU IBCRPR oirf) (GEPU_IBCR_5 GEPU IBCRPR oirf) (GEPU_IBCR_6 GEPU IBCRPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PR_GEPU_IBCR_robustness.gph, replace

**************************************************************
* PE - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRPE, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFPE IBCRPE, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPE IEFPE Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPE IEFPE Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRPE oirf) (GEPU_IBCR_1 GEPU IBCRPE oirf) (GEPU_IBCR_2 GEPU IBCRPE oirf) (GEPU_IBCR_3 GEPU IBCRPE oirf) (GEPU_IBCR_4 GEPU IBCRPE oirf) (GEPU_IBCR_5 GEPU IBCRPE oirf) (GEPU_IBCR_6 GEPU IBCRPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PE_GEPU_IBCR_robustness.gph, replace

**************************************************************
* RJ - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRRJ, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFRJ IBCRRJ, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRRJ IEFRJ Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRRJ IEFRJ Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRRJ oirf) (GEPU_IBCR_1 GEPU IBCRRJ oirf) (GEPU_IBCR_2 GEPU IBCRRJ oirf) (GEPU_IBCR_3 GEPU IBCRRJ oirf) (GEPU_IBCR_4 GEPU IBCRRJ oirf) (GEPU_IBCR_5 GEPU IBCRRJ oirf) (GEPU_IBCR_6 GEPU IBCRRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RJ_GEPU_IBCR_robustness.gph, replace

**************************************************************
* RS - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRRS, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFRS IBCRRS, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRRS IEFRS Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRRS IEFRS Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRRS oirf) (GEPU_IBCR_1 GEPU IBCRRS oirf) (GEPU_IBCR_2 GEPU IBCRRS oirf) (GEPU_IBCR_3 GEPU IBCRRS oirf) (GEPU_IBCR_4 GEPU IBCRRS oirf) (GEPU_IBCR_5 GEPU IBCRRS oirf) (GEPU_IBCR_6 GEPU IBCRRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RS_GEPU_IBCR_robustness.gph, replace

**************************************************************
* SC - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRSC, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFSC IBCRSC, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRSC IEFSC Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRSC IEFSC Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRSC oirf) (GEPU_IBCR_1 GEPU IBCRSC oirf) (GEPU_IBCR_2 GEPU IBCRSC oirf) (GEPU_IBCR_3 GEPU IBCRSC oirf) (GEPU_IBCR_4 GEPU IBCRSC oirf) (GEPU_IBCR_5 GEPU IBCRSC oirf) (GEPU_IBCR_6 GEPU IBCRSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SC_GEPU_IBCR_robustness.gph, replace

**************************************************************
* SP - GEPU - IBCR

* BASE
svar GEPU BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A) exog(time)
irf create GEPU_IBCR_1, replace step(24)

* Model 2
svar GEPU BVSP Selic IBCRSP, lags(1/2) aeq(B)
irf create GEPU_IBCR_2, replace step(24)

* Model 3
svar GEPU Selic IEFSP IBCRSP, lags(1/2) aeq(B)
irf create GEPU_IBCR_3, replace step(24)

* Model 4
svar IBCRSP IEFSP Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_4, replace step(24)

* Model 5
svar GEPU IBCRSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_IBCR_5, replace step(24)

* Model 6
svar IBCRSP IEFSP Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_IBCR_6, replace step(24)

irf ograph (GEPU_IBCR_0 GEPU IBCRSP oirf) (GEPU_IBCR_1 GEPU IBCRSP oirf) (GEPU_IBCR_2 GEPU IBCRSP oirf) (GEPU_IBCR_3 GEPU IBCRSP oirf) (GEPU_IBCR_4 GEPU IBCRSP oirf) (GEPU_IBCR_5 GEPU IBCRSP oirf) (GEPU_IBCR_6 GEPU IBCRSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SP_GEPU_IBCR_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_GEPU_IBCR_robustness.gph graph_CE_GEPU_IBCR_robustness.gph graph_ES_GEPU_IBCR_robustness.gph graph_GO_GEPU_IBCR_robustness.gph graph_MG_GEPU_IBCR_robustness.gph graph_PA_GEPU_IBCR_robustness.gph graph_PR_GEPU_IBCR_robustness.gph graph_PE_GEPU_IBCR_robustness.gph graph_RJ_GEPU_IBCR_robustness.gph graph_RS_GEPU_IBCR_robustness.gph graph_SC_GEPU_IBCR_robustness.gph graph_SP_GEPU_IBCR_robustness.gph, rows(3) cols(4) title("Robustez - IBCR - GEPU") graphregion(color(white)) legendfrom(graph_BA_GEPU_IBCR_robustness.gph)

* Save combinated graphs
graph save graph_EPU_IBCR_robustness.gph, replace

