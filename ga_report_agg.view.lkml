#view: ga_report_agg {
# # You can specify the table name if it's different from the view name:
# sql_table_name: my_schema_name.tester ;;
#
# # Define your dimensions and measures here, like this:
# dimension: user_id {
#   description: "Unique ID for each user that has ordered"
#   type: number
#   sql: ${TABLE}.user_id ;;
# }
#
# dimension: lifetime_orders {
#   description: "The total number of orders for each user"
#   type: number
#   sql: ${TABLE}.lifetime_orders ;;
# }
#
# dimension_group: most_recent_purchase {
#   description: "The date when each user last ordered"
#   type: time
#   timeframes: [date, week, month, year]
#   sql: ${TABLE}.most_recent_purchase_at ;;
# }
#
# measure: total_lifetime_orders {
#   description: "Use this for counting lifetime orders across many users"
#   type: sum
#   sql: ${lifetime_orders} ;;
# }
#}

view: ga_report_agg {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql: SELECT sum(ga_goal17completions) as goal_compl, CONCAT("https://www.blendo.co","", ga_landingpagepath) as page
          FROM `gandalf-bq.blendo.ga_report`
          group by ga_landingpagepath
       ;;
  }

  # Define your dimensions and measures here, like this:
  measure: goal_compl {
    type: sum
    sql: ${TABLE}.goal_compl ;;
  }

  dimension: ga_landingpagepath {
    type: string
    sql: ${TABLE}.ga_landingpagepath ;;
  }

  dimension: landingpagepath_complete {
    type: string
    sql:  CONCAT("https://www.blendo.co","", ga_landingpagepath) ;;
  }
}
