import os
import subprocess
import numpy as np
import math
import scipy.stats as stats

def runsZTest(l):
    l_median = np.median(l)
    runs, n1, n2 = 0, 0, 0

    # Checking for start of new run
    for i in range(len(l)):

        # no. of runs
        if (l[i] >= l_median and l[i-1] < l_median) or \
                (l[i] < l_median and l[i-1] >= l_median):
            runs += 1

        # no. of positive values
        if(l[i]) >= l_median:
            n1 += 1

        # no. of negative values
        else:
            n2 += 1

    runs_exp = ((2*n1*n2)/(n1+n2))+1
    stan_dev = math.sqrt((2*n1*n2*(2*n1*n2-n1-n2))/ \
                         (((n1+n2)**2)*(n1+n2-1)))

    z = (runs-runs_exp)/stan_dev

    return z

def main():

    if not os.path.exists("output.txt"):
        printf("--- Generating Random Numbers ---")
        make_process = subprocess.Popen(["make"], stdout=subprocess.PIPE)
        make_process.wait()
    rn = []
    with open("output.txt") as f:
        for line in f:
            rn.append(int(line.strip()))

    print("--- Testing  Random Numbers ---")

    print("--- Z-Statistics ---")
    z = runsZTest(rn)
    assert abs(z) < 1.95
    print("Z-Statistics Passed")

    print("--- Kolmogrov Smirnov ---")
    kstat, pval = stats.kstest(np.array(rn)/np.iinfo('uint32').max, "uniform")
    assert kstat < 0.05
    print("Kolmogrov Smirnov Passed")

    print("--- Chi-Squared ---")
    hist = stats.histogram(rn, 100, (0, np.iinfo('uint32').max))
    chistat, chi_pval = stats.chisquare(hist.count)
    assert chi_pval > 0.05
    print("Chi-Squared Test Passed")


if __name__ == "__main__":
    main()
