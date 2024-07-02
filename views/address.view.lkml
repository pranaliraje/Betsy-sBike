# The name of this view in Looker is "Address"
view: address {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.Address` ;;
  drill_fields: [address_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: address_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.AddressID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Address Line1" in Explore.

  dimension: address_line1 {
    type: string
    sql: ${TABLE}.AddressLine1 ;;
  }

  dimension: address_line2 {
    type: string
    sql: ${TABLE}.AddressLine2 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country_region_code {
    type: string
    sql: ${TABLE}.CountryRegionCode ;;
  }

  dimension: country_region_name {
    type: string
    sql: ${TABLE}.CountryRegionName ;;
  }

  dimension: is_only_state_province_flag {
    type: number
    sql: ${TABLE}.IsOnlyStateProvinceFlag ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_is_only_state_province_flag {
    type: sum
    sql: ${is_only_state_province_flag} ;;  }
  measure: average_is_only_state_province_flag {
    type: average
    sql: ${is_only_state_province_flag} ;;  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.PostalCode ;;
  }

  dimension: state_province_code {
    type: string
    sql: ${TABLE}.StateProvinceCode ;;
  }

  dimension: state_province_name {
    type: string
    sql: ${TABLE}.StateProvinceName ;;
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
    drill_fields: [address_id, country_region_name, state_province_name]
  }
}
