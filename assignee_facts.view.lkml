view: ticket_assignee_facts {
  derived_table: {
    #     sql_trigger_value: CURRENT_DATE
    #     sortkeys: [assignee_id]
    #     distkey: assignee_id
    sql: SELECT
        assignee_id
        , count(*) as lifetime_tickets
        , min(created_at) as first_ticket
        , max(created_at) as latest_ticket
        , 1.0 * COUNT(*)/NULLIF(DATEDIFF(day,MIN(created_at),CURRENT_DATE),0) AS avg_tickets_per_day
      FROM zendesk._tickets
      GROUP BY 1
       ;;
  }

  dimension: assignee_id {
    primary_key: yes
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: lifetime_tickets {
    type: number
    value_format_name: id
    sql: ${TABLE}.lifetime_tickets ;;
  }

  dimension_group: first_ticket {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_ticket ;;
  }

  dimension_group: latest_ticket {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.latest_ticket ;;
  }

  dimension: avg_tickets_per_day {
    #     hidden: true
    type: number
    sql: ${TABLE}.avg_tickets_per_day ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_lifetime_tickets {
    type: sum
    sql: ${lifetime_tickets} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [assignee_id, lifetime_tickets, first_ticket_time, latest_ticket_time, avg_tickets_per_day]
  }
}
