clear all

* Change DIR
cd "C:\Users\Paulo\Desktop\MineDoc\MONOGRAFIA\DADOS\Data\Resultados"

* Import Data
import excel using "C:\Users\Paulo\Desktop\MineDoc\MONOGRAFIA\DADOS\Data\Resultados\final_base.xlsx", firstrow clear

************* IRF3CUM *************

* Model 1
regress IRF3CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib

* Model 2
regress IRF3CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib

* Model 3
regress IRF3CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib DensidadeDemografica


************* IRF6CUM *************

* Model 1
regress IRF6CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib

* Model 2
regress IRF6CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib

* Model 3
regress IRF6CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib DensidadeDemografica

************* IRF9CUM *************

* Model 1
regress IRF9CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib

* Model 2
regress IRF9CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib

* Model 3
regress IRF9CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib DensidadeDemografica


************* IRF12CUM *************

* Model 1
regress IRF12CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib

* Model 2
regress IRF12CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib

* Model 3
regress IRF12CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib DensidadeDemografica

************* IRF24CUM *************

* Model 1
regress IRF24CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib

* Model 2
regress IRF24CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib

* Model 3
regress IRF24CUM Agro Construcao Extrativa Transformacao financas Bem state_expenditure_pib export_liq_pib DensidadeDemografica
