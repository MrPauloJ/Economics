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
cd "..\..\..\Figures\Stata Graph\GEPU\Robustness\PIM"

* Set the IRF database
irf set "impulses_PIM_GEPU_robustness.irf", replace

**************************************************************
*************************** PIM ******************************
**************************************************************

**************************************************************
* BA - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMBA, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFBA PIMBA, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMBA IEFBA Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMBA IEFBA Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMBA oirf) (GEPU_PIM_1 GEPU PIMBA oirf) (GEPU_PIM_2 GEPU PIMBA oirf) (GEPU_PIM_3 GEPU PIMBA oirf) (GEPU_PIM_4 GEPU PIMBA oirf) (GEPU_PIM_5 GEPU PIMBA oirf) (GEPU_PIM_6 GEPU PIMBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

graph save graph_BA_GEPU_PIM_robustness.gph, replace

**************************************************************
* CE - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMCE, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFCE PIMCE, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMCE IEFCE Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMCE IEFCE Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMCE oirf) (GEPU_PIM_1 GEPU PIMCE oirf) (GEPU_PIM_2 GEPU PIMCE oirf) (GEPU_PIM_3 GEPU PIMCE oirf) (GEPU_PIM_4 GEPU PIMCE oirf) (GEPU_PIM_5 GEPU PIMCE oirf) (GEPU_PIM_6 GEPU PIMCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_CE_GEPU_PIM_robustness.gph, replace

**************************************************************
* ES - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFES PIMES, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFES PIMES, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMES, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFES PIMES, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMES IEFES Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMES IEFES Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMES oirf) (GEPU_PIM_1 GEPU PIMES oirf) (GEPU_PIM_2 GEPU PIMES oirf) (GEPU_PIM_3 GEPU PIMES oirf) (GEPU_PIM_4 GEPU PIMES oirf) (GEPU_PIM_5 GEPU PIMES oirf) (GEPU_PIM_6 GEPU PIMES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_ES_GEPU_PIM_robustness.gph, replace

**************************************************************
* GO - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMGO, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFGO PIMGO, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMGO IEFGO Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMGO IEFGO Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMGO oirf) (GEPU_PIM_1 GEPU PIMGO oirf) (GEPU_PIM_2 GEPU PIMGO oirf) (GEPU_PIM_3 GEPU PIMGO oirf) (GEPU_PIM_4 GEPU PIMGO oirf) (GEPU_PIM_5 GEPU PIMGO oirf) (GEPU_PIM_6 GEPU PIMGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_GO_GEPU_PIM_robustness.gph, replace

**************************************************************
* MG - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMMG, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFMG PIMMG, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMMG IEFMG Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMMG IEFMG Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMMG oirf) (GEPU_PIM_1 GEPU PIMMG oirf) (GEPU_PIM_2 GEPU PIMMG oirf) (GEPU_PIM_3 GEPU PIMMG oirf) (GEPU_PIM_4 GEPU PIMMG oirf) (GEPU_PIM_5 GEPU PIMMG oirf) (GEPU_PIM_6 GEPU PIMMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_MG_GEPU_PIM_robustness.gph, replace

**************************************************************
* PA - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMPA, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFPA PIMPA, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMPA IEFPA Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMPA IEFPA Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMPA oirf) (GEPU_PIM_1 GEPU PIMPA oirf) (GEPU_PIM_2 GEPU PIMPA oirf) (GEPU_PIM_3 GEPU PIMPA oirf) (GEPU_PIM_4 GEPU PIMPA oirf) (GEPU_PIM_5 GEPU PIMPA oirf) (GEPU_PIM_6 GEPU PIMPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PA_GEPU_PIM_robustness.gph, replace

**************************************************************
* PR - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMPR, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFPR PIMPR, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMPR IEFPR Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMPR IEFPR Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMPR oirf) (GEPU_PIM_1 GEPU PIMPR oirf) (GEPU_PIM_2 GEPU PIMPR oirf) (GEPU_PIM_3 GEPU PIMPR oirf) (GEPU_PIM_4 GEPU PIMPR oirf) (GEPU_PIM_5 GEPU PIMPR oirf) (GEPU_PIM_6 GEPU PIMPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PR_GEPU_PIM_robustness.gph, replace

**************************************************************
* PE - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMPE, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFPE PIMPE, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMPE IEFPE Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMPE IEFPE Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMPE oirf) (GEPU_PIM_1 GEPU PIMPE oirf) (GEPU_PIM_2 GEPU PIMPE oirf) (GEPU_PIM_3 GEPU PIMPE oirf) (GEPU_PIM_4 GEPU PIMPE oirf) (GEPU_PIM_5 GEPU PIMPE oirf) (GEPU_PIM_6 GEPU PIMPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PE_GEPU_PIM_robustness.gph, replace

**************************************************************
* RJ - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMRJ, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFRJ PIMRJ, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMRJ IEFRJ Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMRJ IEFRJ Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMRJ oirf) (GEPU_PIM_1 GEPU PIMRJ oirf) (GEPU_PIM_2 GEPU PIMRJ oirf) (GEPU_PIM_3 GEPU PIMRJ oirf) (GEPU_PIM_4 GEPU PIMRJ oirf) (GEPU_PIM_5 GEPU PIMRJ oirf) (GEPU_PIM_6 GEPU PIMRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RJ_GEPU_PIM_robustness.gph, replace

**************************************************************
* RS - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMRS, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFRS PIMRS, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMRS IEFRS Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMRS IEFRS Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMRS oirf) (GEPU_PIM_1 GEPU PIMRS oirf) (GEPU_PIM_2 GEPU PIMRS oirf) (GEPU_PIM_3 GEPU PIMRS oirf) (GEPU_PIM_4 GEPU PIMRS oirf) (GEPU_PIM_5 GEPU PIMRS oirf) (GEPU_PIM_6 GEPU PIMRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RS_GEPU_PIM_robustness.gph, replace

**************************************************************
* SC - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMSC, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFSC PIMSC, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMSC IEFSC Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMSC IEFSC Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMSC oirf) (GEPU_PIM_1 GEPU PIMSC oirf) (GEPU_PIM_2 GEPU PIMSC oirf) (GEPU_PIM_3 GEPU PIMSC oirf) (GEPU_PIM_4 GEPU PIMSC oirf) (GEPU_PIM_5 GEPU PIMSC oirf) (GEPU_PIM_6 GEPU PIMSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SC_GEPU_PIM_robustness.gph, replace

**************************************************************
* SP - GEPU - PIM

* BASE
svar GEPU BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A)
irf create GEPU_PIM_0, replace step(24)

* Model 1
svar GEPU BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A) exog(time)
irf create GEPU_PIM_1, replace step(24)

* Model 2
svar GEPU BVSP Selic PIMSP, lags(1/2) aeq(B)
irf create GEPU_PIM_2, replace step(24)

* Model 3
svar GEPU Selic IEFSP PIMSP, lags(1/2) aeq(B)
irf create GEPU_PIM_3, replace step(24)

* Model 4
svar PIMSP IEFSP Selic GEPU BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_4, replace step(24)

* Model 5
svar GEPU PIMSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create GEPU_PIM_5, replace step(24)

* Model 6
svar PIMSP IEFSP Selic BVSP GEPU, lags(1/2) aeq(A)
irf create GEPU_PIM_6, replace step(24)

irf ograph (GEPU_PIM_0 GEPU PIMSP oirf) (GEPU_PIM_1 GEPU PIMSP oirf) (GEPU_PIM_2 GEPU PIMSP oirf) (GEPU_PIM_3 GEPU PIMSP oirf) (GEPU_PIM_4 GEPU PIMSP oirf) (GEPU_PIM_5 GEPU PIMSP oirf) (GEPU_PIM_6 GEPU PIMSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SP_GEPU_PIM_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_GEPU_PIM_robustness.gph graph_CE_GEPU_PIM_robustness.gph graph_ES_GEPU_PIM_robustness.gph graph_GO_GEPU_PIM_robustness.gph graph_MG_GEPU_PIM_robustness.gph graph_PA_GEPU_PIM_robustness.gph graph_PR_GEPU_PIM_robustness.gph graph_PE_GEPU_PIM_robustness.gph graph_RJ_GEPU_PIM_robustness.gph graph_RS_GEPU_PIM_robustness.gph graph_SC_GEPU_PIM_robustness.gph graph_SP_GEPU_PIM_robustness.gph, rows(3) cols(4) title("Robustez - PIM - GEPU Br") graphregion(color(white)) legendfrom(graph_BA_GEPU_PIM_robustness.gph)

* Save combinated graphs
graph save graph_GEPU_PIM_robustness.gph, replace