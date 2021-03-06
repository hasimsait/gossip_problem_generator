# Usage:

    ./problem_generator.py d n percentageOfNegativeGoals "existing negative goals"

# Example:

    ./problem_generator.py 1 4 0.60 "1-2 2-1 4-3"

You do not have to provide a seed ("existing negative goals" and "1-2 2-1 4-3" above).<br>
If you do, it will respect the provided negative goals and add new ones to reach percentageOfNegativeGoals negative goals per agent.<br>
Seed must always be in **"** and the negative goals must be seperated by " "(space).<br>
Always use **-** between agent-secret.

Generated problem instance is saved in a file named problem_d_n_percentage.pddl.<br>
The example above would output the resulting instance to problem_1_4_60.pddl.

It also prints a line similiar to the provided seed input which can be used as seed for new instances.<br>

If you enter a percentage lower than the seed (for the example above, asking for 0% negative goals per agent), it will throw "ValueError: Sample larger than population or is negative". It can not remove negative goals therefore it can not achieve less negative goals than the provided seed.

It also applies to 100% (1.0). Each agent knows their own piece of the secret to begin with and we can not make agents forget the secrets that they know.

If you want to have true 100% negative goals per agent (which will always be infeasible), you can comment out the 37th line of goal_generator.py.

while ! singularity run -C -H $MYRUNDIR $MYPLANNER $MYDOMAIN "$MYRUNDIR/random/problem_d_n_p.pddl" $MYRUNDIR/sas_plan; do path/to/gossip_problem_generator/problem_generator.py d n 0.p; done

while a plan can not be found for the problem_d_n_p.pddl on MYDOMAIN
generate a new problem instance (goal state instance)


