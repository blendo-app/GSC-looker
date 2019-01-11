view: ga_report {
  sql_table_name: blendo.ga_report ;;

  dimension: blendo_exported_at {
    type: number
    sql: ${TABLE}.blendo_exported_at ;;
  }

  dimension: blendo_id {
    type: string
    sql: ${TABLE}.blendo_id ;;
  }

  dimension: blendo_imported_at {
    type: number
    sql: ${TABLE}.blendo_imported_at ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: ga_goal17completions {
    type: number
    sql: ${TABLE}.ga_goal17completions ;;
  }

  dimension: ga_landingpagepath {
    type: string
    sql: ${TABLE}.ga_landingpagepath ;;
  }

  dimension: landingpagepath_complete {
    type: string
    sql:  CONCAT("https://www.blendo.co","", ga_landingpagepath) ;;
  }
  dimension: ga_newusers {
    type: number
    sql: ${TABLE}.ga_newusers ;;
  }

  dimension: ga_sessions {
    type: number
    sql: ${TABLE}.ga_sessions ;;
  }

  dimension: ga_users {
    type: number
    sql: ${TABLE}.ga_users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
