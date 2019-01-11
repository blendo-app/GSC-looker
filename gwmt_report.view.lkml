view: gwmt_report {
  sql_table_name: blendo.gwmt_report ;;

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

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
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

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: page {
    type: string
    sql: ${TABLE}.page ;;
  }

  dimension: position {
    type: number
    sql: ${TABLE}.position ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_position {
    type: average
    sql: ${position} ;;
  }

  measure: avg_ctr {
    type: average
    sql: ${ctr} ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }


}
