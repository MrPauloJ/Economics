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
cd "..\..\..\Figures\Stata Graph\IIE\Robustness\PIM"

* Set the IRF database
irf set "impulses_PIM_IIE_robustness.irf", replace

**************************************************************
*************************** PIM ******************************
**************************************************************

**************************************************************
* BA - IIE - PIM

* BASE
svar IIE BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFBA PIMBA, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMBA, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFBA PIMBA, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMBA IEFBA Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMBA IEFBA Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMBA oirf) (IIE_PIM_1 IIE PIMBA oirf) (IIE_PIM_2 IIE PIMBA oirf) (IIE_PIM_3 IIE PIMBA oirf) (IIE_PIM_4 IIE PIMBA oirf) (IIE_PIM_5 IIE PIMBA oirf) (IIE_PIM_6 IIE PIMBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

graph save graph_BA_IIE_PIM_robustness.gph, replace

**************************************************************
* CE - IIE - PIM

* BASE
svar IIE BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFCE PIMCE, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMCE, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFCE PIMCE, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMCE IEFCE Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMCE IEFCE Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMCE oirf) (IIE_PIM_1 IIE PIMCE oirf) (IIE_PIM_2 IIE PIMCE oirf) (IIE_PIM_3 IIE PIMCE oirf) (IIE_PIM_4 IIE PIMCE oirf) (IIE_PIM_5 IIE PIMCE oirf) (IIE_PIM_6 IIE PIMCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_CE_IIE_PIM_robustness.gph, replace

**************************************************************
* ES - IIE - PIM

* BASE
svar IIE BVSP Selic IEFES PIMES, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFES PIMES, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMES, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFES PIMES, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMES IEFES Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMES IEFES Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMES oirf) (IIE_PIM_1 IIE PIMES oirf) (IIE_PIM_2 IIE PIMES oirf) (IIE_PIM_3 IIE PIMES oirf) (IIE_PIM_4 IIE PIMES oirf) (IIE_PIM_5 IIE PIMES oirf) (IIE_PIM_6 IIE PIMES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_ES_IIE_PIM_robustness.gph, replace

**************************************************************
* GO - IIE - PIM

* BASE
svar IIE BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFGO PIMGO, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMGO, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFGO PIMGO, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMGO IEFGO Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMGO IEFGO Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMGO oirf) (IIE_PIM_1 IIE PIMGO oirf) (IIE_PIM_2 IIE PIMGO oirf) (IIE_PIM_3 IIE PIMGO oirf) (IIE_PIM_4 IIE PIMGO oirf) (IIE_PIM_5 IIE PIMGO oirf) (IIE_PIM_6 IIE PIMGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_GO_IIE_PIM_robustness.gph, replace

**************************************************************
* MG - IIE - PIM

* BASE
svar IIE BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFMG PIMMG, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMMG, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFMG PIMMG, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMMG IEFMG Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMMG IEFMG Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMMG oirf) (IIE_PIM_1 IIE PIMMG oirf) (IIE_PIM_2 IIE PIMMG oirf) (IIE_PIM_3 IIE PIMMG oirf) (IIE_PIM_4 IIE PIMMG oirf) (IIE_PIM_5 IIE PIMMG oirf) (IIE_PIM_6 IIE PIMMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_MG_IIE_PIM_robustness.gph, replace

**************************************************************
* PA - IIE - PIM

* BASE
svar IIE BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPA PIMPA, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMPA, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFPA PIMPA, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMPA IEFPA Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMPA IEFPA Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMPA oirf) (IIE_PIM_1 IIE PIMPA oirf) (IIE_PIM_2 IIE PIMPA oirf) (IIE_PIM_3 IIE PIMPA oirf) (IIE_PIM_4 IIE PIMPA oirf) (IIE_PIM_5 IIE PIMPA oirf) (IIE_PIM_6 IIE PIMPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PA_IIE_PIM_robustness.gph, replace

**************************************************************
* PR - IIE - PIM

* BASE
svar IIE BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPR PIMPR, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMPR, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFPR PIMPR, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMPR IEFPR Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMPR IEFPR Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMPR oirf) (IIE_PIM_1 IIE PIMPR oirf) (IIE_PIM_2 IIE PIMPR oirf) (IIE_PIM_3 IIE PIMPR oirf) (IIE_PIM_4 IIE PIMPR oirf) (IIE_PIM_5 IIE PIMPR oirf) (IIE_PIM_6 IIE PIMPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PR_IIE_PIM_robustness.gph, replace

**************************************************************
* PE - IIE - PIM

* BASE
svar IIE BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPE PIMPE, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMPE, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFPE PIMPE, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMPE IEFPE Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMPE IEFPE Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMPE oirf) (IIE_PIM_1 IIE PIMPE oirf) (IIE_PIM_2 IIE PIMPE oirf) (IIE_PIM_3 IIE PIMPE oirf) (IIE_PIM_4 IIE PIMPE oirf) (IIE_PIM_5 IIE PIMPE oirf) (IIE_PIM_6 IIE PIMPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_PE_IIE_PIM_robustness.gph, replace

**************************************************************
* RJ - IIE - PIM

* BASE
svar IIE BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFRJ PIMRJ, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMRJ, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFRJ PIMRJ, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMRJ IEFRJ Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMRJ IEFRJ Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMRJ oirf) (IIE_PIM_1 IIE PIMRJ oirf) (IIE_PIM_2 IIE PIMRJ oirf) (IIE_PIM_3 IIE PIMRJ oirf) (IIE_PIM_4 IIE PIMRJ oirf) (IIE_PIM_5 IIE PIMRJ oirf) (IIE_PIM_6 IIE PIMRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RJ_IIE_PIM_robustness.gph, replace

**************************************************************
* RS - IIE - PIM

* BASE
svar IIE BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFRS PIMRS, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMRS, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFRS PIMRS, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMRS IEFRS Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMRS IEFRS Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMRS oirf) (IIE_PIM_1 IIE PIMRS oirf) (IIE_PIM_2 IIE PIMRS oirf) (IIE_PIM_3 IIE PIMRS oirf) (IIE_PIM_4 IIE PIMRS oirf) (IIE_PIM_5 IIE PIMRS oirf) (IIE_PIM_6 IIE PIMRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_RS_IIE_PIM_robustness.gph, replace

**************************************************************
* SC - IIE - PIM

* BASE
svar IIE BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFSC PIMSC, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMSC, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFSC PIMSC, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMSC IEFSC Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMSC IEFSC Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMSC oirf) (IIE_PIM_1 IIE PIMSC oirf) (IIE_PIM_2 IIE PIMSC oirf) (IIE_PIM_3 IIE PIMSC oirf) (IIE_PIM_4 IIE PIMSC oirf) (IIE_PIM_5 IIE PIMSC oirf) (IIE_PIM_6 IIE PIMSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SC_IIE_PIM_robustness.gph, replace

**************************************************************
* SP - IIE - PIM

* BASE
svar IIE BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A)
irf create IIE_PIM_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFSP PIMSP, lags(1/2) aeq(A) exog(time)
irf create IIE_PIM_1, replace step(24)

* Model 2
svar IIE BVSP Selic PIMSP, lags(1/2) aeq(B)
irf create IIE_PIM_2, replace step(24)

* Model 3
svar IIE Selic IEFSP PIMSP, lags(1/2) aeq(B)
irf create IIE_PIM_3, replace step(24)

* Model 4
svar PIMSP IEFSP Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_4, replace step(24)

* Model 5
svar IIE PIMSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create IIE_PIM_5, replace step(24)

* Model 6
svar PIMSP IEFSP Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_PIM_6, replace step(24)

irf ograph (IIE_PIM_0 IIE PIMSP oirf) (IIE_PIM_1 IIE PIMSP oirf) (IIE_PIM_2 IIE PIMSP oirf) (IIE_PIM_3 IIE PIMSP oirf) (IIE_PIM_4 IIE PIMSP oirf) (IIE_PIM_5 IIE PIMSP oirf) (IIE_PIM_6 IIE PIMSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

graph save graph_SP_IIE_PIM_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_IIE_PIM_robustness.gph graph_CE_IIE_PIM_robustness.gph graph_ES_IIE_PIM_robustness.gph graph_GO_IIE_PIM_robustness.gph graph_MG_IIE_PIM_robustness.gph graph_PA_IIE_PIM_robustness.gph graph_PR_IIE_PIM_robustness.gph graph_PE_IIE_PIM_robustness.gph graph_RJ_IIE_PIM_robustness.gph graph_RS_IIE_PIM_robustness.gph graph_SC_IIE_PIM_robustness.gph graph_SP_IIE_PIM_robustness.gph, rows(3) cols(4) title("Robustez - PIM - IIE Br") graphregion(color(white)) legendfrom(graph_BA_IIE_PIM_robustness.gph)

* Save combinated graphs
graph save graph_IIE_PIM_robustness.gph, replace