view: audits__events {
  sql_table_name: looker_zendesk.audits__events ;;

  dimension: id_change_events {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: _rjm_source_key_id {
    type: number
    sql: ${TABLE}._rjm_source_key_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: agreement_id {
    type: number
    sql: ${TABLE}.agreement_id ;;
  }

  dimension: audit_id {
    type: number
    sql: ${TABLE}.audit_id ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: previous_value {
    type: string
    sql: ${TABLE}.previous_value ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: ticket_id {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${audits.ticket_id} ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [date, week, month]
    sql: ${audits.created_at_date} ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id_change_events, field_name, audits.id, audits.via__source__from__name, audits.via__source__to__name]
  }

  # ----- ADDITIONAL FIELDS -----

  ## The SQL in this dimensions should be updated to reflect whatever your business
  dimension: number_of_agent_touches {
    ## considers and "agent touch"
    type: number
    hidden: yes
    sql: CASE
      WHEN ${value} IN ('true','false','incident') THEN 1
      ELSE 0
      END
       ;;
  }

  measure: total_agent_touches {
    type: sum
    sql: ${number_of_agent_touches} ;;
  }

  measure: count_unique_tickets {
    type: count_distinct
    sql: ${ticket_id} ;;
  }

  measure: average_agents_touches {
    type: average
    sql: ${number_of_agent_touches} ;;
  }
}
