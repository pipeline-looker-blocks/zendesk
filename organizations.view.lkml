view: organizations {
  sql_table_name: zendesk.organizations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: shared_comments {
    type: yesno
    sql: ${TABLE}.shared_comments ;;
  }

  dimension: shared_tickets {
    type: yesno
    sql: ${TABLE}.shared_tickets ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: group_id {
    type: yesno
    sql: ${TABLE}.group_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
