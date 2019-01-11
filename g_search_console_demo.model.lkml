connection: "looker_bq_demo"

# include all the views
include: "*.view"

datagroup: g_search_console_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: g_search_console_demo_default_datagroup

explore: gwmt_report {}
