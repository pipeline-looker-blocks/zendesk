view: tickets__fields {
  sql_table_name: looker_zendesk.tickets__fields ;;

  dimension: id_field_value {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count_field_values {
    type: count
    drill_fields: [id_field_value]
  }
}
