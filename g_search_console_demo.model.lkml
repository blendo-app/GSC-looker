connection: "looker_bq_demo"

# include all the views
include: "*.view"

datagroup: g_search_console_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: g_search_console_demo_default_datagroup

explore: gwmt_report {
  join: ga_report_agg {
    sql_on: ${gwmt_report.page} = ${ga_report_agg.page} ;;
    relationship: one_to_one
    type: left_outer # Could be excluded since left_outer is the default
  }
}

explore: ga_report {}

explore: ga_report_agg{}
