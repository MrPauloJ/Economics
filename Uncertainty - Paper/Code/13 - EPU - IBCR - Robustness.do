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
cd "..\..\..\Figures\Stata Graph\EPU\Robustness\IBCR"

* Set the IRF database
irf set "impulses_IBCR_EPU_robustness.irf", replace

**************************************************************
*************************** IBCR *****************************
**************************************************************

**************************************************************
* BA - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRBA, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFBA IBCRBA, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRBA IEFBA Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRBA IEFBA Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRBA oirf) (EPU_IBCR_1 EPU IBCRBA oirf) (EPU_IBCR_2 EPU IBCRBA oirf) (EPU_IBCR_3 EPU IBCRBA oirf) (EPU_IBCR_4 EPU IBCRBA oirf) (EPU_IBCR_5 EPU IBCRBA oirf) (EPU_IBCR_6 EPU IBCRBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

graph save graph_BA_EPU_IBCR_robustness.gph, replace

**************************************************************
* CE - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRCE, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFCE IBCRCE, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRCE IEFCE Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRCE IEFCE Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRCE oirf) (EPU_IBCR_1 EPU IBCRCE oirf) (EPU_IBCR_2 EPU IBCRCE oirf) (EPU_IBCR_3 EPU IBCRCE oirf) (EPU_IBCR_4 EPU IBCRCE oirf) (EPU_IBCR_5 EPU IBCRCE oirf) (EPU_IBCR_6 EPU IBCRCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_CE_EPU_IBCR_robustness.gph, replace

**************************************************************
* ES - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFES IBCRES, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFES IBCRES, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRES, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFES IBCRES, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRES IEFES Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRES IEFES Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRES oirf) (EPU_IBCR_1 EPU IBCRES oirf) (EPU_IBCR_2 EPU IBCRES oirf) (EPU_IBCR_3 EPU IBCRES oirf) (EPU_IBCR_4 EPU IBCRES oirf) (EPU_IBCR_5 EPU IBCRES oirf) (EPU_IBCR_6 EPU IBCRES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_ES_EPU_IBCR_robustness.gph, replace

**************************************************************
* GO - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRGO, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFGO IBCRGO, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRGO IEFGO Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRGO IEFGO Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRGO oirf) (EPU_IBCR_1 EPU IBCRGO oirf) (EPU_IBCR_2 EPU IBCRGO oirf) (EPU_IBCR_3 EPU IBCRGO oirf) (EPU_IBCR_4 EPU IBCRGO oirf) (EPU_IBCR_5 EPU IBCRGO oirf) (EPU_IBCR_6 EPU IBCRGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_GO_EPU_IBCR_robustness.gph, replace

**************************************************************
* MG - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRMG, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFMG IBCRMG, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRMG IEFMG Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRMG IEFMG Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRMG oirf) (EPU_IBCR_1 EPU IBCRMG oirf) (EPU_IBCR_2 EPU IBCRMG oirf) (EPU_IBCR_3 EPU IBCRMG oirf) (EPU_IBCR_4 EPU IBCRMG oirf) (EPU_IBCR_5 EPU IBCRMG oirf) (EPU_IBCR_6 EPU IBCRMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_MG_EPU_IBCR_robustness.gph, replace

**************************************************************
* PA - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRPA, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFPA IBCRPA, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPA IEFPA Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPA IEFPA Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRPA oirf) (EPU_IBCR_1 EPU IBCRPA oirf) (EPU_IBCR_2 EPU IBCRPA oirf) (EPU_IBCR_3 EPU IBCRPA oirf) (EPU_IBCR_4 EPU IBCRPA oirf) (EPU_IBCR_5 EPU IBCRPA oirf) (EPU_IBCR_6 EPU IBCRPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PA_EPU_IBCR_robustness.gph, replace

**************************************************************
* PR - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRPR, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFPR IBCRPR, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPR IEFPR Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPR IEFPR Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRPR oirf) (EPU_IBCR_1 EPU IBCRPR oirf) (EPU_IBCR_2 EPU IBCRPR oirf) (EPU_IBCR_3 EPU IBCRPR oirf) (EPU_IBCR_4 EPU IBCRPR oirf) (EPU_IBCR_5 EPU IBCRPR oirf) (EPU_IBCR_6 EPU IBCRPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PR_EPU_IBCR_robustness.gph, replace

**************************************************************
* PE - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRPE, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFPE IBCRPE, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRPE IEFPE Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRPE IEFPE Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRPE oirf) (EPU_IBCR_1 EPU IBCRPE oirf) (EPU_IBCR_2 EPU IBCRPE oirf) (EPU_IBCR_3 EPU IBCRPE oirf) (EPU_IBCR_4 EPU IBCRPE oirf) (EPU_IBCR_5 EPU IBCRPE oirf) (EPU_IBCR_6 EPU IBCRPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PE_EPU_IBCR_robustness.gph, replace

**************************************************************
* RJ - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRRJ, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFRJ IBCRRJ, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRRJ IEFRJ Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRRJ IEFRJ Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRRJ oirf) (EPU_IBCR_1 EPU IBCRRJ oirf) (EPU_IBCR_2 EPU IBCRRJ oirf) (EPU_IBCR_3 EPU IBCRRJ oirf) (EPU_IBCR_4 EPU IBCRRJ oirf) (EPU_IBCR_5 EPU IBCRRJ oirf) (EPU_IBCR_6 EPU IBCRRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RJ_EPU_IBCR_robustness.gph, replace

**************************************************************
* RS - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRRS, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFRS IBCRRS, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRRS IEFRS Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRRS IEFRS Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRRS oirf) (EPU_IBCR_1 EPU IBCRRS oirf) (EPU_IBCR_2 EPU IBCRRS oirf) (EPU_IBCR_3 EPU IBCRRS oirf) (EPU_IBCR_4 EPU IBCRRS oirf) (EPU_IBCR_5 EPU IBCRRS oirf) (EPU_IBCR_6 EPU IBCRRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RS_EPU_IBCR_robustness.gph, replace

**************************************************************
* SC - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRSC, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFSC IBCRSC, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRSC IEFSC Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRSC IEFSC Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRSC oirf) (EPU_IBCR_1 EPU IBCRSC oirf) (EPU_IBCR_2 EPU IBCRSC oirf) (EPU_IBCR_3 EPU IBCRSC oirf) (EPU_IBCR_4 EPU IBCRSC oirf) (EPU_IBCR_5 EPU IBCRSC oirf) (EPU_IBCR_6 EPU IBCRSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SC_EPU_IBCR_robustness.gph, replace

**************************************************************
* SP - EPU - IBCR

* BASE
svar EPU BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A)
irf create EPU_IBCR_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A) exog(time)
irf create EPU_IBCR_1, replace step(24)

* Model 2
svar EPU BVSP Selic IBCRSP, lags(1/2) aeq(B)
irf create EPU_IBCR_2, replace step(24)

* Model 3
svar EPU Selic IEFSP IBCRSP, lags(1/2) aeq(B)
irf create EPU_IBCR_3, replace step(24)

* Model 4
svar IBCRSP IEFSP Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_4, replace step(24)

* Model 5
svar EPU IBCRSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create EPU_IBCR_5, replace step(24)

* Model 6
svar IBCRSP IEFSP Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_IBCR_6, replace step(24)

irf ograph (EPU_IBCR_0 EPU IBCRSP oirf) (EPU_IBCR_1 EPU IBCRSP oirf) (EPU_IBCR_2 EPU IBCRSP oirf) (EPU_IBCR_3 EPU IBCRSP oirf) (EPU_IBCR_4 EPU IBCRSP oirf) (EPU_IBCR_5 EPU IBCRSP oirf) (EPU_IBCR_6 EPU IBCRSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SP_EPU_IBCR_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_EPU_IBCR_robustness.gph graph_CE_EPU_IBCR_robustness.gph graph_ES_EPU_IBCR_robustness.gph graph_GO_EPU_IBCR_robustness.gph graph_MG_EPU_IBCR_robustness.gph graph_PA_EPU_IBCR_robustness.gph graph_PR_EPU_IBCR_robustness.gph graph_PE_EPU_IBCR_robustness.gph graph_RJ_EPU_IBCR_robustness.gph graph_RS_EPU_IBCR_robustness.gph graph_SC_EPU_IBCR_robustness.gph graph_SP_EPU_IBCR_robustness.gph, rows(3) cols(4) title("Robustez - IBCR - EPU Br") graphregion(color(white)) legendfrom(graph_BA_EPU_IBCR_robustness.gph)

* Save combinated graphs
graph save graph_EPU_IBCR_robustness.gph, replace

