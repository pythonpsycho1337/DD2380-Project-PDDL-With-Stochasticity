---Prerequisites---
Install pyparsing using "python3-pip install pyparsing"
Build the fast-downward planner according to the fast-downard website http://www.fast-downward.org/ObtainingAndRunningFastDownward
Put the fastDownard planner in the PDDL direcory and name the directory FastDownward

---Run---
NOTE: To execute bash scripts the execute permission must be set for the executing user. This can be done using the chmomd command

To run the fixed weight experiment with normal traffic levels execute:
./normalTraffic.sh

To run the fixed weight experiment with delayed traffic in the central parts of the city execute:
./chaosTraffic.sh

To run the stochastic fast-downward simply open a terminal and execute (Be aware that at the moment this script can not run with action cost)
python3 stochasticFD.py

To clean the outputs of the above mentioned experiments:
./clean.sh


