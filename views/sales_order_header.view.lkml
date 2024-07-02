# The name of this view in Looker is "Sales Order Header"
view: sales_order_header {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.SalesOrderHeader` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account Number" in Explore.

  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }

  dimension: bill_to_address_id {
    type: number
    sql: ${TABLE}.BillToAddressID ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CustomerID ;;
  }

  dimension: freight {
    type: number
    sql: ${TABLE}.Freight ;;
  }

  dimension: local_currency {
    type: string
    sql: ${TABLE}.LocalCurrency ;;
  }

  dimension: online_order_flag {
    type: number
    sql: ${TABLE}.OnlineOrderFlag ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: order {
    type: time
    timeframes: [raw, date, week, month, quarter, year,month_name]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.OrderDate ;;
  }

  dimension: purchase_order_number {
    type: string
    sql: ${TABLE}.PurchaseOrderNumber ;;
  }

  dimension: revision_number {
    type: number
    sql: ${TABLE}.RevisionNumber ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revision_number {
    type: sum
    sql: ${revision_number} ;;  }
  measure: average_revision_number {
    type: average
    sql: ${revision_number} ;;  }

  dimension: sales_order_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.SalesOrderID ;;
  }

  dimension: sales_order_number {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }

  dimension: ship_method_id {
    type: number
    sql: ${TABLE}.ShipMethodID ;;
  }

  dimension: ship_to_address_id {
    type: number
    sql: ${TABLE}.ShipToAddressID ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.Status ;;
  }

  dimension: tax_amt {
    type: number
    sql: ${TABLE}.TaxAmt ;;
  }


  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [customer.customer_id]
  }

  dimension: Sales_type {
    type: string
    sql: if(${online_order_flag} = -1,'Online',if(${online_order_flag} = 0,'Direct','Other')) ;;
  }

  dimension: Sales_preson {
    type: string
    sql: if(${online_order_flag} = 0,${employee_details.full_name},'Website sales')  ;;
  }

  dimension: sales_person1 {
    type: string
    sql: if(${Sales_type} = 'Direct',${employee_details.full_name},
    if(${Sales_type} = 'Online','Website_sales','NA')) ;;
  }



}
