version 14

clear
set more off
pause on

// Data
import excel ForbesData2018.xls, sheet("Sheet1") firstrow

// Table 1
summarize age, detail
summarize wealth, detail
summarize relativewealth, detail

pause

// natural log of wealth levels
gen log_wealth = log(wealth)

// Figure 1
histogram age, kdensity

pause

// Figure 2
histogram log_wealth, kdensity

pause

// Figure 3
kdens2 age log_wealth

pause

// Table 2: structural
nl (relativewealth = {b1}*exp({b2}*age)), vce(robust)
// Table 2: reduced-form, linear
nl (relativewealth = {b1}+{b2}*age), vce(robust)
// Table 2: reduced-form, quadratic
nl (relativewealth = {b1}+{b2}*age+{b3}*age^2), vce(robust)

pause

// Table 3: wealth
extreme gpd wealth, vce(robust)
// Table 3: relative wealth
extreme gpd relativewealth, vce(robust)
