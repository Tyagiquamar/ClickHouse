SET enable_analyzer = 1;
SET enable_join_runtime_filters = 1;
SET join_algorithm = 'hash';
SET query_plan_join_swap_table = 0;
SET query_plan_optimize_join_order_limit = 1;
SET join_runtime_filter_from_fixed_hash_table = 0;
SET join_runtime_filter_size_from_hash_table_stats = 0;
SET join_runtime_filter_min_probe_rows = 0;
SET join_runtime_filter_exact_values_limit = 10000;

SELECT 'float_nan_exact', count()
FROM (SELECT toFloat64('nan') AS k) AS p
INNER JOIN (SELECT toFloat64('nan') AS k) AS b ON p.k = b.k;

SELECT 'left_anti_nan_exact', count()
FROM (SELECT toFloat64('nan') AS k) AS p
LEFT ANTI JOIN (SELECT toFloat64('nan') AS k) AS b ON p.k = b.k;
