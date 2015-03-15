#!/bin/sh
# Run this script directly on the db server.
#SCHOOLS-- some schools come up twice(slightly differing names)

echo COPY division FROM vlds - DONE
psql -c "COPY (
    SELECT DISTINCT div_num AS num, div_name as name
    FROM fall_membership
    WHERE div_num IS NOT NULL and div_name IS NOT NULL
    ORDER BY num, name
  ) TO STDOUT;" vlds | \
  psql -c "COPY division FROM STDIN;" valite

echo COPY school FROM vlds - DONE
psql -c "COPY (
    SELECT DISTINCT sch_num AS num, sch_name AS name, div_num
    FROM fall_membership
    WHERE sch_num IS NOT NULL AND sch_name IS NOT NULL AND div_num IS NOT NULL
    ORDER BY num, name, div_num
  ) TO STDOUT;" vlds | \
  psql -c "COPY school FROM STDIN;" valite

echo COPY cte FROM vlds - DONE
psql -c "COPY (
    SELECT sch_num, div_num, school_year AS year, cte_program_num AS num, cte_program_name AS name, max(completer_cnt)
    FROM cte_completer
    GROUP BY div_num, sch_num, year, num, name
    ORDER BY div_num, sch_num, year, num, name
  ) TO STDOUT;" vlds | \
  psql -c "COPY cte FROM STDIN;" valite

echo COPY test_data FROM vlds - DONE
psql -c "COPY (
    SELECT sch_num, div_num, school_year as sch_year, subject, test, test_level, avg_sol_scale_score, pass_advanced_rate, pass_prof_rate, pass_rate, fail_rate
    FROM sol_test_data
    WHERE federal_race_code IS NULL AND GENDER IS NULL AND disability_flag IS NULL AND lep_flag is NULL AND disadvantaged_flag IS NULL
    ORDER BY div_num, sch_num, sch_year, subject, test, test_level
  ) TO STDOUT;" vlds | \
  psql -c "COPY test_data FROM STDIN;" valite

echo COPY hs_grads_completer FROM vlds - DONE
psql -c "COPY (
    SELECT DISTINCT sch_num, div_num, school_year AS sch_year, hs_completion_num AS num, hs_completion_name AS name, hs_completer_cnt AS completer_cnt
    FROM hs_graduate
    WHERE federal_race_code IS NULL AND GENDER IS NULL AND disability_flag IS NULL AND lep_flag is NULL AND disadvantaged_flag IS NULL
    ORDER BY sch_year, div_num, sch_num, num
  ) TO STDOUT;" vlds | \
  psql -c "COPY hs_grads_completer FROM STDIN;" valite

echo COPY dropouts FROM vlds - DONE
psql -c "COPY (
    SELECT DISTINCT sch_num, div_num, school_year AS sch_year, grade_code, dropout_cnt
    FROM annual_dropout
    WHERE federal_race_code IS NULL AND GENDER IS NULL AND disability_flag IS NULL AND lep_flag is NULL AND disadvantaged_flag IS NULL
    ORDER BY sch_year, div_num, sch_num, grade_code
  ) TO STDOUT;" vlds | \
  psql -c "COPY dropouts FROM STDIN;" valite

#psql -h db.cs.jmu.edu valite < create.sql
