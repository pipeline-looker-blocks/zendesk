view: ticket__tags {
  sql_table_name: zendesk.tickets__tags ;;

  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${tickets.created_at_time}::timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
