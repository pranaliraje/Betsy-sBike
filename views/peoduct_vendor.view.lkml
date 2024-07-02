# The name of this view in Looker is "Peoduct Vendor"
view: peoduct_vendor {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.PeoductVendor` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Average Lead Time" in Explore.

  dimension: average_lead_time {
    type: number
    sql: ${TABLE}.AverageLeadTime ;;
  }

  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }

  dimension: last_receipt_cost {
    type: number
    sql: ${TABLE}.LastReceiptCost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_last_receipt_cost {
    type: sum
    sql: ${last_receipt_cost} ;;  }
  measure: average_last_receipt_cost {
    type: average
    sql: ${last_receipt_cost} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_receipt {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.LastReceiptDate ;;
  }

  dimension: max_order_qty {
    type: number
    sql: ${TABLE}.MaxOrderQty ;;
  }

  dimension: min_order_qty {
    type: number
    sql: ${TABLE}.MinOrderQty ;;
  }

  dimension: on_order_qty {
    type: number
    sql: ${TABLE}.OnOrderQty ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }

  dimension: standard_price {
    type: number
    sql: ${TABLE}.StandardPrice ;;
  }

  dimension: unit_measure_code {
    type: string
    sql: ${TABLE}.UnitMeasureCode ;;
  }
  measure: count {
    type: count
    drill_fields: [product.product_id, product.name]
  }
}
