# Parallel tests skip list is currently generated manually. All tests except those in parallel_skip.txt will run in parallel.
# Current list is generated with following commands
# 1. Put non-parallel test into the array
# ending with / means the directory, without trailing slash acts as glob
NON_PARALLEL_TESTS=(
  test_atomic_drop_table/
  test_attach_without_fetching/
  test_cleanup_dir_after_bad_zk_conn/
  test_consistent_parts_after_clone_replica/
  test_crash_log/
  test_cross_replication/
  test_ddl_worker_non_leader/
  test_delayed_replica_failover/
  test_dictionary_allow_read_expired_keys/
  test_disabled_mysql_server/
  test_distributed_respect_user_timeouts/
  test_dns_cache/
  test_global_overcommit_tracker/
  test_grpc_protocol/
  test_host_regexp_multiple_ptr_records/
  test_http_failover/
  test_https_replication/
  test_insert_into_distributed/
  test_insert_into_distributed_through_materialized_view/
  test_keeper_map/
  test_keeper_multinode_simple/
  test_keeper_two_nodes_cluster/
  test_limited_replicated_fetches/
  test_merge_tree_s3/
  test_mysql_database_engine/
  test_parts_delete_zookeeper/
  test_profile_max_sessions_for_user/
  test_quorum_inserts_parallel/
  test_random_inserts/
  test_redirect_url_storage/
  test_replace_partition/
  test_replicated_database/
  test_replicated_fetches_timeouts/
  test_replicated_merge_tree_wait_on_shutdown/
  test_server_reload/
  test_storage_kafka/
  test_storage_kerberized_kafka/
  test_storage_s3/
  test_system_flush_logs/
  test_system_logs/
  test_system_metrics/
  test_system_replicated_fetches/
  test_ttl_move/
  test_user_ip_restrictions/
  test_zookeeper_config_load_balancing/
  test_zookeeper_fallback_session/
)
# 2. Filter known tests that are currently not run in parallel
printf "%s\n" "${NON_PARALLEL_TESTS[@]}" | jq -R -n '[inputs] | .' > parallel_skip.json
