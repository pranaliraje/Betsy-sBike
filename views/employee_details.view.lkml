# The name of this view in Looker is "Employee Details"
view: employee_details {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.EmployeeDetails` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Base Rate" in Explore.

  dimension: base_rate {
    type: number
    sql: ${TABLE}.BaseRate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_base_rate {
    type: sum
    sql: ${base_rate} ;;  }
  measure: average_base_rate {
    type: average
    sql: ${base_rate} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: birth {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.BirthDate ;;
  }

  dimension: current_flag {
    type: number
    sql: ${TABLE}.CurrentFlag ;;
  }

  dimension: department_name {
    type: string
    sql: ${TABLE}.DepartmentName ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.EmailAddress ;;
  }

  dimension: emergency_contact_name {
    type: string
    sql: ${TABLE}.EmergencyContactName ;;
  }

  dimension: emergency_contact_phone {
    type: string
    sql: ${TABLE}.EmergencyContactPhone ;;
  }

  dimension: employee_business_entity_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.EmployeeBusinessEntityID ;;
  }

  dimension: end_date {
    type: string
    sql: ${TABLE}.EndDate ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.FirstName ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.`Full Name` ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension_group: hire {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.HireDate ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LastName ;;
  }

  dimension: marital_status {
    type: string
    sql: ${TABLE}.MaritalStatus ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.MiddleName ;;
  }

  dimension: parent_employee_business_entity_id {
    type: number
    sql: ${TABLE}.ParentEmployeeBusinessEntityID ;;
  }

  dimension: pay_frequency {
    type: number
    sql: ${TABLE}.PayFrequency ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  dimension: quota_exc_flag {
    type: number
    sql: ${TABLE}.QuotaExcFlag ;;
  }

  dimension: salaried_flag {
    type: number
    sql: ${TABLE}.SalariedFlag ;;
  }

  dimension: sales_person_flag {
    type: number
    sql: ${TABLE}.SalesPersonFlag ;;
  }

  dimension: sales_territory_key {
    type: number
    sql: ${TABLE}.SalesTerritoryKey ;;
  }

  dimension: sick_leave_hours {
    type: number
    sql: ${TABLE}.SickLeaveHours ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: vacation_hours {
    type: number
    sql: ${TABLE}.VacationHours ;;
  }

  dimension: yield {
    type: number
    sql: ${TABLE}.Yield ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  full_name,
  first_name,
  middle_name,
  department_name,
  last_name,
  emergency_contact_name
  ]
  }

 # dimension: sales_person_name {
  #  type: string
   # sql: if(${sales_territory_history.Sales_territory_id} = '285','Syed E. Abbas',${full_name}) ;;
  #}



}
