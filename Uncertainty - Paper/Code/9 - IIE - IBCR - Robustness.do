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
cd "..\..\..\Figures\Stata Graph\IIE\Robustness\IBCR"

* Set the IRF database
irf set "impulses_IBCR_IIE_robustness.irf", replace

**************************************************************
*************************** IBCR *****************************
**************************************************************

**************************************************************
* BA - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFBA IBCRBA, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRBA, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFBA IBCRBA, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRBA IEFBA Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRBA IEFBA Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRBA IEFBA Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRBA oirf) (IIE_IBCR_1 IIE IBCRBA oirf) (IIE_IBCR_2 IIE IBCRBA oirf) (IIE_IBCR_3 IIE IBCRBA oirf) (IIE_IBCR_4 IIE IBCRBA oirf) (IIE_IBCR_5 IIE IBCRBA oirf) (IIE_IBCR_6 IIE IBCRBA oirf), title("BA") yline(0, lcolor("black")) graphregion(color(white)) subtitle("") xtitle("") ytitle("") legend(label(1 "Modelo Base") label(2 "Modelo 1") label(3 "Modelo 2") label(4 "Modelo 3") label(5 "Modelo 4") label(6 "Modelo 5") label(7 "Modelo 6") row(2) region(style(none)) symplacement(center) pos(6)) ylabel(, angle(0))

* Save graph
graph save graph_BA_IIE_IBCR_robustness.gph, replace

**************************************************************
* CE - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFCE IBCRCE, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRCE, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFCE IBCRCE, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRCE IEFCE Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRCE IEFCE Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRCE IEFCE Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRCE oirf) (IIE_IBCR_1 IIE IBCRCE oirf) (IIE_IBCR_2 IIE IBCRCE oirf) (IIE_IBCR_3 IIE IBCRCE oirf) (IIE_IBCR_4 IIE IBCRCE oirf) (IIE_IBCR_5 IIE IBCRCE oirf) (IIE_IBCR_6 IIE IBCRCE oirf), title("CE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_CE_IIE_IBCR_robustness.gph, replace

**************************************************************
* ES - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFES IBCRES, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFES IBCRES, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRES, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFES IBCRES, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRES IEFES Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRES IEFES Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRES IEFES Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRES oirf) (IIE_IBCR_1 IIE IBCRES oirf) (IIE_IBCR_2 IIE IBCRES oirf) (IIE_IBCR_3 IIE IBCRES oirf) (IIE_IBCR_4 IIE IBCRES oirf) (IIE_IBCR_5 IIE IBCRES oirf) (IIE_IBCR_6 IIE IBCRES oirf), title("ES") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_ES_IIE_IBCR_robustness.gph, replace

**************************************************************
* GO - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFGO IBCRGO, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRGO, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFGO IBCRGO, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRGO IEFGO Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRGO IEFGO Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRGO IEFGO Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRGO oirf) (IIE_IBCR_1 IIE IBCRGO oirf) (IIE_IBCR_2 IIE IBCRGO oirf) (IIE_IBCR_3 IIE IBCRGO oirf) (IIE_IBCR_4 IIE IBCRGO oirf) (IIE_IBCR_5 IIE IBCRGO oirf) (IIE_IBCR_6 IIE IBCRGO oirf), title("GO") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_GO_IIE_IBCR_robustness.gph, replace

**************************************************************
* MG - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFMG IBCRMG, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRMG, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFMG IBCRMG, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRMG IEFMG Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRMG IEFMG Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRMG IEFMG Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRMG oirf) (IIE_IBCR_1 IIE IBCRMG oirf) (IIE_IBCR_2 IIE IBCRMG oirf) (IIE_IBCR_3 IIE IBCRMG oirf) (IIE_IBCR_4 IIE IBCRMG oirf) (IIE_IBCR_5 IIE IBCRMG oirf) (IIE_IBCR_6 IIE IBCRMG oirf), title("MG") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_MG_IIE_IBCR_robustness.gph, replace

**************************************************************
* PA - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPA IBCRPA, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRPA, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFPA IBCRPA, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRPA IEFPA Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRPA IEFPA Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRPA IEFPA Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRPA oirf) (IIE_IBCR_1 IIE IBCRPA oirf) (IIE_IBCR_2 IIE IBCRPA oirf) (IIE_IBCR_3 IIE IBCRPA oirf) (IIE_IBCR_4 IIE IBCRPA oirf) (IIE_IBCR_5 IIE IBCRPA oirf) (IIE_IBCR_6 IIE IBCRPA oirf), title("PA") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_PA_IIE_IBCR_robustness.gph, replace

**************************************************************
* PR - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPR IBCRPR, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRPR, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFPR IBCRPR, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRPR IEFPR Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRPR IEFPR Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRPR IEFPR Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRPR oirf) (IIE_IBCR_1 IIE IBCRPR oirf) (IIE_IBCR_2 IIE IBCRPR oirf) (IIE_IBCR_3 IIE IBCRPR oirf) (IIE_IBCR_4 IIE IBCRPR oirf) (IIE_IBCR_5 IIE IBCRPR oirf) (IIE_IBCR_6 IIE IBCRPR oirf), title("PR") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_PR_IIE_IBCR_robustness.gph, replace

**************************************************************
* PE - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFPE IBCRPE, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRPE, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFPE IBCRPE, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRPE IEFPE Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRPE IEFPE Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRPE IEFPE Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRPE oirf) (IIE_IBCR_1 IIE IBCRPE oirf) (IIE_IBCR_2 IIE IBCRPE oirf) (IIE_IBCR_3 IIE IBCRPE oirf) (IIE_IBCR_4 IIE IBCRPE oirf) (IIE_IBCR_5 IIE IBCRPE oirf) (IIE_IBCR_6 IIE IBCRPE oirf), title("PE") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_PE_IIE_IBCR_robustness.gph, replace

**************************************************************
* RJ - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFRJ IBCRRJ, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRRJ, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFRJ IBCRRJ, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRRJ IEFRJ Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRRJ IEFRJ Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRRJ IEFRJ Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRRJ oirf) (IIE_IBCR_1 IIE IBCRRJ oirf) (IIE_IBCR_2 IIE IBCRRJ oirf) (IIE_IBCR_3 IIE IBCRRJ oirf) (IIE_IBCR_4 IIE IBCRRJ oirf) (IIE_IBCR_5 IIE IBCRRJ oirf) (IIE_IBCR_6 IIE IBCRRJ oirf), title("RJ") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_RJ_IIE_IBCR_robustness.gph, replace

**************************************************************
* RS - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFRS IBCRRS, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRRS, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFRS IBCRRS, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRRS IEFRS Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRRS IEFRS Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRRS IEFRS Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRRS oirf) (IIE_IBCR_1 IIE IBCRRS oirf) (IIE_IBCR_2 IIE IBCRRS oirf) (IIE_IBCR_3 IIE IBCRRS oirf) (IIE_IBCR_4 IIE IBCRRS oirf) (IIE_IBCR_5 IIE IBCRRS oirf) (IIE_IBCR_6 IIE IBCRRS oirf), title("RS") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_RS_IIE_IBCR_robustness.gph, replace

**************************************************************
* SC - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFSC IBCRSC, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRSC, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFSC IBCRSC, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRSC IEFSC Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRSC IEFSC Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRSC IEFSC Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRSC oirf) (IIE_IBCR_1 IIE IBCRSC oirf) (IIE_IBCR_2 IIE IBCRSC oirf) (IIE_IBCR_3 IIE IBCRSC oirf) (IIE_IBCR_4 IIE IBCRSC oirf) (IIE_IBCR_5 IIE IBCRSC oirf) (IIE_IBCR_6 IIE IBCRSC oirf), title("SC") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_SC_IIE_IBCR_robustness.gph, replace

**************************************************************
* SP - IIE - IBCR

* BASE
svar IIE BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A)
irf create IIE_IBCR_0, replace step(24)

* Model 1
svar IIE BVSP Selic IEFSP IBCRSP, lags(1/2) aeq(A) exog(time)
irf create IIE_IBCR_1, replace step(24)

* Model 2
svar IIE BVSP Selic IBCRSP, lags(1/2) aeq(B)
irf create IIE_IBCR_2, replace step(24)

* Model 3
svar IIE Selic IEFSP IBCRSP, lags(1/2) aeq(B)
irf create IIE_IBCR_3, replace step(24)

* Model 4
svar IBCRSP IEFSP Selic IIE BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_4, replace step(24)

* Model 5
svar IIE IBCRSP IEFSP Selic BVSP, lags(1/2) aeq(A)
irf create IIE_IBCR_5, replace step(24)

* Model 6
svar IBCRSP IEFSP Selic BVSP IIE, lags(1/2) aeq(A)
irf create IIE_IBCR_6, replace step(24)

* Combine models of Orthogonalized Impulse-Response Function
irf ograph (IIE_IBCR_0 IIE IBCRSP oirf) (IIE_IBCR_1 IIE IBCRSP oirf) (IIE_IBCR_2 IIE IBCRSP oirf) (IIE_IBCR_3 IIE IBCRSP oirf) (IIE_IBCR_4 IIE IBCRSP oirf) (IIE_IBCR_5 IIE IBCRSP oirf) (IIE_IBCR_6 IIE IBCRSP oirf), title("SP") yline(0, lcolor("black")) legend(off) graphregion(color(white)) subtitle("") xtitle("") ytitle("") ylabel(, angle(0))

* Save graph
graph save graph_SP_IIE_IBCR_robustness.gph, replace

**************************************************************************
* Combine All Graphs
**************************************************************************

* Combine all graphs in one with legends
grc1leg graph_BA_IIE_IBCR_robustness.gph graph_CE_IIE_IBCR_robustness.gph graph_ES_IIE_IBCR_robustness.gph graph_GO_IIE_IBCR_robustness.gph graph_MG_IIE_IBCR_robustness.gph graph_PA_IIE_IBCR_robustness.gph graph_PR_IIE_IBCR_robustness.gph graph_PE_IIE_IBCR_robustness.gph graph_RJ_IIE_IBCR_robustness.gph graph_RS_IIE_IBCR_robustness.gph graph_SC_IIE_IBCR_robustness.gph graph_SP_IIE_IBCR_robustness.gph, rows(3) cols(4) title("Robustez - IBCR - IIE Br") graphregion(color(white)) legendfrom(graph_BA_IIE_IBCR_robustness.gph)

* Save combinated graphs
graph save graph_IIE_IBCR_robustness.gph, replace

