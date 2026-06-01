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
cd "..\..\..\Figures\Stata Graph\EPU\Robustness\PIM"

* Set the IRF database
irf set "impulses_PIM_EPU_robustness.irf", replace

**************************************************************
*************************** PIM ******************************
**************************************************************

**************************************************************
* BA - EPU - PIM

* BASE
svar EPU BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMBA, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFBA PIMBA, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMBA IEFBA Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMBA IEFBA Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMBA oirf) (EPU_PIM_1 EPU PIMBA oirf) (EPU_PIM_2 EPU PIMBA oirf) (EPU_PIM_3 EPU PIMBA oirf) (EPU_PIM_4 EPU PIMBA oirf) (EPU_PIM_5 EPU PIMBA oirf) (EPU_PIM_6 EPU PIMBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

graph save graph_BA_EPU_PIM_robustness.gph, replace

**************************************************************
* CE - EPU - PIM

* BASE
svar EPU BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMCE, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFCE PIMCE, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMCE IEFCE Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMCE IEFCE Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMCE oirf) (EPU_PIM_1 EPU PIMCE oirf) (EPU_PIM_2 EPU PIMCE oirf) (EPU_PIM_3 EPU PIMCE oirf) (EPU_PIM_4 EPU PIMCE oirf) (EPU_PIM_5 EPU PIMCE oirf) (EPU_PIM_6 EPU PIMCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_CE_EPU_PIM_robustness.gph, replace

**************************************************************
* ES - EPU - PIM

* BASE
svar EPU BVSP Selic IEFES PIMES, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFES PIMES, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMES, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFES PIMES, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMES IEFES Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMES IEFES Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMES oirf) (EPU_PIM_1 EPU PIMES oirf) (EPU_PIM_2 EPU PIMES oirf) (EPU_PIM_3 EPU PIMES oirf) (EPU_PIM_4 EPU PIMES oirf) (EPU_PIM_5 EPU PIMES oirf) (EPU_PIM_6 EPU PIMES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_ES_EPU_PIM_robustness.gph, replace

**************************************************************
* GO - EPU - PIM

* BASE
svar EPU BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMGO, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFGO PIMGO, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMGO IEFGO Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMGO IEFGO Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMGO oirf) (EPU_PIM_1 EPU PIMGO oirf) (EPU_PIM_2 EPU PIMGO oirf) (EPU_PIM_3 EPU PIMGO oirf) (EPU_PIM_4 EPU PIMGO oirf) (EPU_PIM_5 EPU PIMGO oirf) (EPU_PIM_6 EPU PIMGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_GO_EPU_PIM_robustness.gph, replace

**************************************************************
* MG - EPU - PIM

* BASE
svar EPU BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMMG, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFMG PIMMG, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMMG IEFMG Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMMG IEFMG Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMMG oirf) (EPU_PIM_1 EPU PIMMG oirf) (EPU_PIM_2 EPU PIMMG oirf) (EPU_PIM_3 EPU PIMMG oirf) (EPU_PIM_4 EPU PIMMG oirf) (EPU_PIM_5 EPU PIMMG oirf) (EPU_PIM_6 EPU PIMMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_MG_EPU_PIM_robustness.gph, replace

**************************************************************
* PA - EPU - PIM

* BASE
svar EPU BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMPA, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFPA PIMPA, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMPA IEFPA Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMPA IEFPA Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMPA oirf) (EPU_PIM_1 EPU PIMPA oirf) (EPU_PIM_2 EPU PIMPA oirf) (EPU_PIM_3 EPU PIMPA oirf) (EPU_PIM_4 EPU PIMPA oirf) (EPU_PIM_5 EPU PIMPA oirf) (EPU_PIM_6 EPU PIMPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PA_EPU_PIM_robustness.gph, replace

**************************************************************
* PR - EPU - PIM

* BASE
svar EPU BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMPR, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFPR PIMPR, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMPR IEFPR Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMPR IEFPR Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMPR oirf) (EPU_PIM_1 EPU PIMPR oirf) (EPU_PIM_2 EPU PIMPR oirf) (EPU_PIM_3 EPU PIMPR oirf) (EPU_PIM_4 EPU PIMPR oirf) (EPU_PIM_5 EPU PIMPR oirf) (EPU_PIM_6 EPU PIMPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PR_EPU_PIM_robustness.gph, replace

**************************************************************
* PE - EPU - PIM

* BASE
svar EPU BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMPE, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFPE PIMPE, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMPE IEFPE Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMPE IEFPE Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMPE oirf) (EPU_PIM_1 EPU PIMPE oirf) (EPU_PIM_2 EPU PIMPE oirf) (EPU_PIM_3 EPU PIMPE oirf) (EPU_PIM_4 EPU PIMPE oirf) (EPU_PIM_5 EPU PIMPE oirf) (EPU_PIM_6 EPU PIMPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PE_EPU_PIM_robustness.gph, replace

**************************************************************
* RJ - EPU - PIM

* BASE
svar EPU BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMRJ, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFRJ PIMRJ, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMRJ IEFRJ Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMRJ IEFRJ Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMRJ oirf) (EPU_PIM_1 EPU PIMRJ oirf) (EPU_PIM_2 EPU PIMRJ oirf) (EPU_PIM_3 EPU PIMRJ oirf) (EPU_PIM_4 EPU PIMRJ oirf) (EPU_PIM_5 EPU PIMRJ oirf) (EPU_PIM_6 EPU PIMRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RJ_EPU_PIM_robustness.gph, replace

**************************************************************
* RS - EPU - PIM

* BASE
svar EPU BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMRS, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFRS PIMRS, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMRS IEFRS Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMRS IEFRS Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMRS oirf) (EPU_PIM_1 EPU PIMRS oirf) (EPU_PIM_2 EPU PIMRS oirf) (EPU_PIM_3 EPU PIMRS oirf) (EPU_PIM_4 EPU PIMRS oirf) (EPU_PIM_5 EPU PIMRS oirf) (EPU_PIM_6 EPU PIMRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RS_EPU_PIM_robustness.gph, replace

**************************************************************
* SC - EPU - PIM

* BASE
svar EPU BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMSC, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFSC PIMSC, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMSC IEFSC Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMSC IEFSC Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMSC oirf) (EPU_PIM_1 EPU PIMSC oirf) (EPU_PIM_2 EPU PIMSC oirf) (EPU_PIM_3 EPU PIMSC oirf) (EPU_PIM_4 EPU PIMSC oirf) (EPU_PIM_5 EPU PIMSC oirf) (EPU_PIM_6 EPU PIMSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SC_EPU_PIM_robustness.gph, replace

**************************************************************
* SP - EPU - PIM

* BASE
svar EPU BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A)
irf create EPU_PIM_0, replace step(24)

* Model 1
svar EPU BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A) exog(time)
irf create EPU_PIM_1, replace step(24)

* Model 2
svar EPU BVSP Selic PIMSP, lags(1/2) aeq(B)
irf create EPU_PIM_2, replace step(24)

* Model 3
svar EPU Selic IEFSP PIMSP, lags(1/2) aeq(B)
irf create EPU_PIM_3, replace step(24)

* Model 4
svar PIMSP IEFSP Selic EPU BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_4, replace step(24)

* Model 5
svar EPU PIMSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create EPU_PIM_5, replace step(24)

* Model 6
svar PIMSP IEFSP Selic BVSP EPU, lags(1/2) aeq(A)
irf create EPU_PIM_6, replace step(24)

irf ograph (EPU_PIM_0 EPU PIMSP oirf) (EPU_PIM_1 EPU PIMSP oirf) (EPU_PIM_2 EPU PIMSP oirf) (EPU_PIM_3 EPU PIMSP oirf) (EPU_PIM_4 EPU PIMSP oirf) (EPU_PIM_5 EPU PIMSP oirf) (EPU_PIM_6 EPU PIMSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SP_EPU_PIM_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_EPU_PIM_robustness.gph graph_CE_EPU_PIM_robustness.gph graph_ES_EPU_PIM_robustness.gph graph_GO_EPU_PIM_robustness.gph graph_MG_EPU_PIM_robustness.gph graph_PA_EPU_PIM_robustness.gph graph_PR_EPU_PIM_robustness.gph graph_PE_EPU_PIM_robustness.gph graph_RJ_EPU_PIM_robustness.gph graph_RS_EPU_PIM_robustness.gph graph_SC_EPU_PIM_robustness.gph graph_SP_EPU_PIM_robustness.gph, rows(3) cols(4) title("Robustez - PIM - EPU Br") graphregion(color(white)) legendfrom(graph_BA_EPU_PIM_robustness.gph)

* Save combinated graphs
graph save graph_EPU_PIM_robustness.gph, replace