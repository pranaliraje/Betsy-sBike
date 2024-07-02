# The name of this view in Looker is "Product"
view: product {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.Product` ;;
  drill_fields: [product_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ProductID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Class" in Explore.

  dimension: class {
    type: string
    sql: ${TABLE}.Class ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.Color ;;
  }

  dimension: days_to_manufacture {
    type: number
    sql: ${TABLE}.DaysToManufacture ;;
  }

  dimension: discontinued_date {
    type: string
    sql: ${TABLE}.DiscontinuedDate ;;
  }

  dimension: finished_goods_flag {
    type: number
    sql: ${TABLE}.FinishedGoodsFlag ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.ListPrice ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_list_price {
    type: sum
    sql: ${list_price} ;;  }
  measure: average_list_price {
    type: average
    sql: ${list_price} ;;  }

  dimension: make_flag {
    type: number
    sql: ${TABLE}.MakeFlag ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: product_line {
    type: string
    sql: ${TABLE}.ProductLine ;;
  }

  dimension: product_model_id {
    type: number
    sql: ${TABLE}.ProductModelID ;;
  }

  dimension: product_number {
    type: string
    sql: ${TABLE}.ProductNumber ;;
  }

  dimension: product_subcategory_id {
    type: number
    sql: ${TABLE}.ProductSubcategoryID ;;
  }

  dimension: reorder_point {
    type: number
    sql: ${TABLE}.ReorderPoint ;;
  }

  dimension: safety_stock_level {
    type: number
    sql: ${TABLE}.SafetyStockLevel ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: sell_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SellEndDate ;;
  }

  dimension_group: sell_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.SellStartDate ;;
  }

  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }

  dimension: size_unit_measure_code {
    type: string
    sql: ${TABLE}.SizeUnitMeasureCode ;;
  }

  dimension: standard_cost {
    type: number
    sql: ${TABLE}.StandardCost ;;
  }

  dimension: style {
    type: string
    sql: ${TABLE}.Style ;;
  }

  dimension: weight {
    type: number
    sql: ${TABLE}.Weight ;;
  }

  dimension: weight_unit_measure_code {
    type: string
    sql: ${TABLE}.WeightUnitMeasureCode ;;
  }
  measure: count {
    type: count
    drill_fields: [product_id, name, peoduct_vendor.count, sales_order_details.count]
  }
}
