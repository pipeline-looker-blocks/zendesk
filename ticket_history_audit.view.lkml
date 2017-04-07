view: ticket_history_audit {
  derived_table: {
    sql: select
        ticket_id
        , count(*) as ticket_actions
        , LAST_VALUE(new_value IGNORE NULLS) OVER (PARTITION BY ticket_id ORDER BY timestamp ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as last_value
      from looker_zendesk.audits__events
      group by 1, 2, 3
       ;;
  }

  dimension: ticket_id {
    type: number
    value_format_name: id
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: ticket_actions {
    type: number
    sql: ${TABLE}.ticket_actions ;;
  }

  dimension: last_value {
    sql: ${TABLE}.last_value ;;
  }

  dimension: is_last_history_entry {
    type: yesno
    sql: ${last_value} = 'closed' ;;
  }

  set: detail {
    fields: [ticket_id, ticket_actions, last_value]
  }
}
