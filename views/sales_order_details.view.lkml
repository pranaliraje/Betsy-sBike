# The name of this view in Looker is "Sales Order Details"
view: sales_order_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.SalesOrderDetails` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Carrier Tracking Number" in Explore.

  dimension: carrier_tracking_number {
    type: string
    sql: ${TABLE}.CarrierTrackingNumber ;;
  }

  dimension: due_date {
    type: string
    sql: ${TABLE}.DueDate ;;
  }

  dimension: order_qty {
    type: number
    sql: ${TABLE}.OrderQty ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ProductID ;;
  }

  dimension: sales_order_detail_id {
    type: number
    sql: ${TABLE}.SalesOrderDetailID ;;
  }

  dimension: sales_order_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.SalesOrderID ;;
  }

  dimension: ship_date {
    type: string
    sql: ${TABLE}.ShipDate ;;
  }

  dimension: special_offer_id {
    type: number
    sql: ${TABLE}.SpecialOfferID ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.UnitPrice ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_unit_price {
    type: sum
    sql: ${unit_price} ;;  }
  measure: average_unit_price {
    type: average
    sql: ${unit_price} ;;  }

  dimension: unit_price_discount {
    type: number
    sql: ${TABLE}.UnitPriceDiscount ;;
  }
  measure: count {
    type: count
    drill_fields: [product.product_id, product.name]
  }

  dimension: discount_value {
    type: number
    sql: (${order_qty} * ${unit_price} * ${unit_price_discount}/100) ;;
  }

  dimension: Sales_dim {
    type: number
    sql: ${order_qty} * ${unit_price} - ${discount_value} ;;
  }

  measure: Sales {
    type: sum
    sql: ${order_qty} * ${unit_price} - (${discount_value}) ;;
    value_format: "#,##0.00"
  }

 # measure: product_cost {
 #   type: sum
 #   sql: ${order_qty} * ${product.standard_cost} ;;
 #   value_format: "#,##0.00"
  #}

 # dimension: product_cost_dim {
  # type: number
   # sql: ${order_qty} * ${product.standard_cost} ;;
  #}

 # dimension: margin_dim {
  #  type: number
   # sql: ${Sales_dim} - ${product_cost_dim} ;;
  #}

  #measure: margin {
   # type: sum
    #sql: ${Sales_dim} - ${product_cost_dim} ;;
    #value_format: "#,##0.00"
 # }

 # measure: %margin {
  #  type: sum
   # sql: ${margin_dim} / ${Sales_dim} ;;
    #value_format: "#,##0.00"
  #}

  dimension: due_date1 {
    type: date
    sql: ${TABLE}.DueDate ;;
  }

  dimension: ship_date1 {
    type: date
    sql: (select FORMAT_DATE(${TABLE}.ShipDate) from `traininglookerteam.BetsyBikes.SalesOrderDetails`) ;;
    #sql: ${TABLE}.ShipDate ;;
  }

  dimension: ship_date2
  {
    type: date
    sql: convert_tz(${TABLE}.ShipDate,'UTC', 'America/New_York');;
  }

  dimension: Delayed_shipment_Order_Id {
    type: number
    sql: if (format_date(${ship_date}) > format_date(${due_date}) , '1') ;;
  }

  measure: delayed_shipments {
    type: count_distinct
    sql: ${Delayed_shipment_Order_Id} ;;
  }
}
